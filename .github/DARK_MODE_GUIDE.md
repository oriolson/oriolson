# 🌙 Dark Mode Implementation Guide

This document explains the dark mode implementation for the Ori Olson GitHub profile README.

## Overview

The implementation uses GitHub's native dark mode support features to automatically switch between light and dark themes based on user preferences. This approach ensures compatibility with GitHub's rendering system while providing an optimal viewing experience.

## Implementation Strategy

### 1. GitHub-Compatible Methods
Instead of using CSS `<style>` tags (which GitHub strips for security), we use:

- **Image Fragment Identifiers**: `#gh-light-mode-only` and `#gh-dark-mode-only`
- **Picture Elements**: With `media` queries for responsive images
- **Separate SVG Assets**: Dedicated light and dark versions of graphics

### 2. Color Scheme

#### Light Mode (Default)
- **Text**: `#24292f` (GitHub's primary text color)
- **Background**: `#ffffff` (GitHub's light background)
- **Secondary Text**: `#656d76` (GitHub's secondary text)
- **Borders**: `#d0d7de` (GitHub's light border color)

#### Dark Mode
- **Text**: `#f0f6fc` (GitHub's dark mode primary text)
- **Background**: `#0d1117` (GitHub's dark background)
- **Secondary Text**: `#8b949e` (GitHub's dark mode secondary text)
- **Borders**: `#30363d` (GitHub's dark border color)

### 3. Assets Structure

```
.github/assets/
├── profile-banner.svg          # Light mode banner
├── profile-banner-dark.svg     # Dark mode banner
├── stats-light.svg            # Light mode stats card
└── stats-dark.svg             # Dark mode stats card
```

## Technical Details

### Fragment Identifiers Method
```markdown
![Light Mode](image.svg#gh-light-mode-only)
![Dark Mode](image-dark.svg#gh-dark-mode-only)
```

### Picture Element Method
```html
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="dark-image.svg">
  <source media="(prefers-color-scheme: light)" srcset="light-image.svg">
  <img alt="Description" src="light-image.svg">
</picture>
```

### SVG Dark Mode Support
SVG files can include CSS media queries:
```css
@media (prefers-color-scheme: dark) {
  .element { fill: #f0f6fc; }
}
```

## Accessibility Considerations

- **WCAG AA Compliance**: All color combinations meet 4.5:1 contrast ratio
- **Alt Text**: All images include descriptive alt text
- **Fallback Support**: Light mode images serve as fallbacks
- **System Preference**: Respects user's OS dark mode setting

## Browser Support

- ✅ Chrome 76+
- ✅ Firefox 67+
- ✅ Safari 12.1+
- ✅ Edge 79+
- ✅ GitHub.com (all supported browsers)

## Testing

1. **Local Testing**: Use browser DevTools to emulate dark mode
2. **GitHub Testing**: Toggle dark mode in GitHub settings
3. **System Testing**: Change OS dark mode setting

### Test Cases
- [ ] Light mode displays light-themed assets
- [ ] Dark mode displays dark-themed assets
- [ ] Images switch automatically with theme changes
- [ ] All text remains readable in both modes
- [ ] Contrast ratios meet accessibility standards

## Best Practices

1. **Consistent Branding**: Maintain visual identity across themes
2. **Performance**: Optimize SVG files for faster loading
3. **Accessibility**: Test with screen readers and high contrast modes
4. **Fallbacks**: Always provide light mode as default fallback

## Maintenance

When updating assets:
1. Update both light and dark versions
2. Test in both themes
3. Validate color contrast ratios
4. Run the validation script: `/tmp/validate-dark-mode.sh`

## References

- [GitHub Dark Mode Documentation](https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/managing-user-account-settings/managing-your-theme-settings)
- [CSS prefers-color-scheme](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme)
- [WCAG Contrast Guidelines](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)