#!/bin/bash

# Define the output file
output_file="codebase_contents.txt"

# Define an array of files and folders to ignore
ignore_list=(
  ".git"
  "node_modules"
  "vendor"
  "features.json"
  "faq.json"
  "curriculum.json"
)

# Function to check if an item matches the ignore list
should_ignore() {
  local item="$1"
  for pattern in "${ignore_list[@]}"; do
    if [[ "$item" == $pattern || "$item" == *"/$pattern"* ]]; then
      return 0 # True: Should ignore
    fi
  done
  return 1 # False: Should not ignore
}

# Start the codebase section
echo "< START CODEBASE />" > "$output_file"

# Function to recursively list files and their contents
generate_contents() {
  local dir="$1"

  # Loop through each file and directory in the given directory
  for item in "$dir"/*; do
    # Check if the item should be ignored
    if should_ignore "$item"; then
      continue
    fi

    # Check if it is a directory, if so, call the function recursively
    if [[ -d "$item" ]]; then
      generate_contents "$item"
    elif [[ -f "$item" ]]; then
      # Get the relative path to the file from the base directory
      rel_path="${item#./}"

      # Print the contents of the file to the output file
      echo -e "---\nCONTENTS OF $rel_path START HERE\n---" >> "$output_file"
      cat "$item" >> "$output_file"
      echo "---" >> "$output_file" # Close the content block with dashes
    fi
  done
}

# Start by generating contents from the current directory
generate_contents "."

# End the codebase section
echo "< END CODEBASE />" >> "$output_file"

# Output the generated file
echo "File '$output_file' generated successfully."
