#!/usr/bin/env python3
"""
Optimize agent descriptions to reduce token usage.
Removes verbose examples and commentary, keeping only essential description.
"""

import os
import re
import sys
from pathlib import Path

def extract_frontmatter(content):
    """Extract YAML frontmatter from markdown content."""
    match = re.match(r'^---\n(.*?)\n---\n(.*)$', content, re.DOTALL)
    if match:
        return match.group(1), match.group(2)
    return None, content

def optimize_description(desc):
    """
    Optimize description by:
    1. Removing <example> blocks entirely
    2. Removing Examples: section
    3. Keeping only the core description (first paragraph)
    """
    # Remove all <example>...</example> blocks
    desc = re.sub(r'\s*<example>.*?</example>\s*', '', desc, flags=re.DOTALL)

    # Remove "Examples:" header and anything after
    desc = re.sub(r'\s*Examples?:\s*$', '', desc, flags=re.MULTILINE)

    # Clean up extra whitespace
    desc = re.sub(r'\n\s*\n\s*\n', '\n\n', desc)
    desc = desc.strip()

    return desc

def parse_yaml_frontmatter(yaml_str):
    """Simple YAML parser for frontmatter."""
    result = {}
    current_key = None
    current_value = []
    in_multiline = False

    for line in yaml_str.split('\n'):
        # Check for key: value or key: |
        match = re.match(r'^(\w+):\s*(.*)$', line)
        if match and not in_multiline:
            # Save previous key if exists
            if current_key:
                result[current_key] = '\n'.join(current_value).strip()

            current_key = match.group(1)
            value = match.group(2)

            if value == '|':
                in_multiline = True
                current_value = []
            else:
                current_value = [value]
                in_multiline = False
        elif in_multiline:
            # Check if line is indented (part of multiline)
            if line.startswith('  ') or line.strip() == '':
                current_value.append(line[2:] if line.startswith('  ') else '')
            else:
                # End of multiline
                in_multiline = False
                result[current_key] = '\n'.join(current_value).strip()
                # Re-process this line
                match = re.match(r'^(\w+):\s*(.*)$', line)
                if match:
                    current_key = match.group(1)
                    current_value = [match.group(2)]

    # Save last key
    if current_key:
        result[current_key] = '\n'.join(current_value).strip()

    return result

def rebuild_frontmatter(parsed, optimized_desc):
    """Rebuild YAML frontmatter with optimized description."""
    lines = []

    # Name first
    if 'name' in parsed:
        lines.append(f"name: {parsed['name']}")

    # Optimized description
    # If description is short enough, use single line
    if '\n' not in optimized_desc and len(optimized_desc) < 200:
        lines.append(f"description: {optimized_desc}")
    else:
        lines.append("description: |")
        for line in optimized_desc.split('\n'):
            lines.append(f"  {line}")

    # Other fields (tools, model, skills)
    for key in ['tools', 'model', 'skills']:
        if key in parsed:
            lines.append(f"{key}: {parsed[key]}")

    return '\n'.join(lines)

def process_agent_file(filepath):
    """Process a single agent file and return optimized content."""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    frontmatter, body = extract_frontmatter(content)
    if not frontmatter:
        print(f"  Warning: No frontmatter found in {filepath}")
        return content, 0, 0

    parsed = parse_yaml_frontmatter(frontmatter)

    if 'description' not in parsed:
        print(f"  Warning: No description in {filepath}")
        return content, 0, 0

    original_desc = parsed['description']
    optimized_desc = optimize_description(original_desc)

    original_len = len(original_desc)
    optimized_len = len(optimized_desc)

    new_frontmatter = rebuild_frontmatter(parsed, optimized_desc)
    new_content = f"---\n{new_frontmatter}\n---\n{body}"

    return new_content, original_len, optimized_len

def main():
    agents_dir = Path(__file__).parent.parent / 'agents'

    if not agents_dir.exists():
        print(f"Error: agents directory not found at {agents_dir}")
        sys.exit(1)

    total_original = 0
    total_optimized = 0
    files_processed = 0

    # Create backup directory
    backup_dir = agents_dir.parent / 'agents_backup'

    dry_run = '--dry-run' in sys.argv

    if dry_run:
        print("DRY RUN - No files will be modified\n")
    else:
        print(f"Creating backup at {backup_dir}\n")
        os.system(f"cp -r {agents_dir} {backup_dir}")

    for md_file in agents_dir.rglob('*.md'):
        if md_file.name == 'README.md':
            continue

        print(f"Processing: {md_file.relative_to(agents_dir)}")

        new_content, orig_len, opt_len = process_agent_file(md_file)

        if orig_len > 0:
            reduction = (1 - opt_len / orig_len) * 100
            print(f"  Description: {orig_len} -> {opt_len} chars ({reduction:.1f}% reduction)")

            total_original += orig_len
            total_optimized += opt_len
            files_processed += 1

            if not dry_run:
                with open(md_file, 'w', encoding='utf-8') as f:
                    f.write(new_content)

    print(f"\n{'='*50}")
    print(f"Files processed: {files_processed}")
    print(f"Total description size: {total_original} -> {total_optimized} chars")
    if total_original > 0:
        print(f"Overall reduction: {(1 - total_optimized / total_original) * 100:.1f}%")

    # Estimate token reduction (rough: 4 chars per token)
    orig_tokens = total_original / 4
    opt_tokens = total_optimized / 4
    print(f"\nEstimated token reduction: ~{orig_tokens:.0f} -> ~{opt_tokens:.0f} tokens")

if __name__ == '__main__':
    main()
