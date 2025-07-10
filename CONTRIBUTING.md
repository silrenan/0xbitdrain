# Contributing to Media Content Downloader

Thank you for considering contributing to the Media Content Downloader
project! We welcome contributions from the community.

## How to Contribute

### Reporting Issues

If you encounter a bug or have a feature request:

1. Search existing issues to avoid duplicates
2. Create a new issue with:
   - Clear title and description
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Your environment (OS, PowerShell version, yt-dlp version)

### Submitting Code Changes

1. **Fork the repository**
   ```bash
   git fork https://github.com/silrenan/0xbitdrain.git
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow PowerShell best practices
   - Add comments for complex logic
   - Test your changes thoroughly

4. **Commit your changes**
   ```bash
   git commit -m "Add: brief description of changes"
   ```

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request**

### Code Style Guidelines

- Use clear, descriptive variable names
- Follow PowerShell naming conventions (PascalCase for functions, camelCase for variables)
- Include error handling for new features
- Add comments for complex logic
- Use consistent indentation (4 spaces)

### Testing

Before submitting:

1. Test the script with various media URLs from different platforms
2. Verify error handling works correctly
3. Test on different platforms if possible
4. Ensure the script works with empty/invalid input files

### Pull Request Guidelines

- Provide a clear description of changes
- Reference related issues
- Include testing steps
- Keep PRs focused on a single feature/fix
- Update documentation if needed

## Development Setup

1. Clone your fork
2. Ensure yt-dlp is installed
3. Create test input files with sample URLs from various platforms
4. Test changes thoroughly

## Questions?

Feel free to open an issue for any questions about contributing!
