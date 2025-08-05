# --- Add User-Specific Library Path ---
# This script is the added to allow user-specific R libraries to be loaded on Glasgow Shiny server.

# Define the path to the user's personal library.
user_lib_path <- "/home/jeff/R/x86_64-redhat-linux-gnu-library/4.5"

# Check if the user's library directory exists
if (dir.exists(user_lib_path)) {
  # Get the current list of library paths
  current_lib_paths <- .libPaths()

  # Combine the user's path with the existing paths.
  # Placing the user's path first ensures that R looks there first.
  .libPaths(c(user_lib_path, current_lib_paths))

  # Optional: Print the library paths to the log for verification.
  # You can view this in the Shiny Server log file.
  print("Updated .libPaths():")
  print(.libPaths())

} else {
  # Optional: Warning if the path doesn't exist
  warning(paste("Specified user library path does not exist:", user_lib_path))
}



