# GitHub Pages

- This guide covers GitHub Pages for hosting documentation, project websites, and portfolios directly from your repository.
- You'll learn to set up, configure, and deploy static websites using GitHub's free hosting service.

---

## 1. GitHub Pages Overview

!!! tip "GitHub Pages Benefits"

    GitHub Pages provides free static website hosting with powerful features:

    - **Free Hosting**: Host static websites at no cost
    - **Custom Domains**: Use your own domain name
    - **HTTPS Support**: Automatic SSL certificates
    - **Jekyll Integration**: Built-in static site generator
    - **Automatic Deployment**: Deploy from repository pushes
    - **Version Control**: Full Git history for your website
    - **Collaborative Editing**: Team editing with pull requests
    - **CDN Distribution**: Fast global content delivery
    - **No Server Management**: Fully managed hosting solution

---

## 2. Types of GitHub Pages Sites

### 2.1. User/Organization Pages

**URL Pattern**: `https://username.github.io`

- One per GitHub account
- Repository must be named `username.github.io`
- Deploys from `main` branch by default
- Perfect for personal portfolios or organization homepages

### 2.2. Project Pages

**URL Pattern**: `https://username.github.io/repository-name`

- One per repository
- Can use any repository name
- Multiple deployment sources available
- Ideal for project documentation and demos

### 2.3. GitHub Enterprise

**URL Pattern**: `https://pages.github-enterprise.com/username/repository`

- Available for GitHub Enterprise users
- Custom domain configuration
- Enhanced security features

---

## 3. Setting Up GitHub Pages

### 3.1. Quick Setup (Simple HTML)

1. **Create Repository**: Create or use existing repository
2. **Add HTML Files**: Add `index.html` and other web files
3. **Enable Pages**:
      - Go to repository **"Settings"**
      - Scroll to **"Pages"** section
      - Select source: **"Deploy from a branch"**
      - Choose branch: **"main"** or **"gh-pages"**
      - Select folder: **"/ (root)"** or **"/docs"**
      - Click **"Save"**

4. **Access Site**: Visit `https://username.github.io/repository-name`

### 3.2. Basic HTML Example

* Create a simple `index.html`:

      ```html
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>My Project</title>
          <link rel="stylesheet" href="styles.css">
      </head>
      <body>
          <header>
              <h1>Welcome to My Project</h1>
              <nav>
                  <a href="#features">Features</a>
                  <a href="#docs">Documentation</a>
                  <a href="#contact">Contact</a>
              </nav>
          </header>
          
          <main>
              <section id="features">
                  <h2>Features</h2>
                  <p>Description of your project features...</p>
              </section>
              
              <section id="docs">
                  <h2>Documentation</h2>
                  <p>Link to your documentation...</p>
              </section>
          </main>
          
          <footer>
              <p>&copy; 2025 Your Name. All rights reserved.</p>
          </footer>
      </body>
      </html>
      ```
    
### 3.3. Directory Structure

Organize your pages site:

    repository/
    ├── index.html          # Home page
    ├── about.html          # About page
    ├── docs/
    │   ├── index.html      # Documentation home
    │   ├── guide.html      # User guide
    │   └── api.html        # API documentation
    ├── assets/
    │   ├── css/
    │   │   └── styles.css  # Stylesheets
    │   ├── js/
    │   │   └── script.js   # JavaScript files
    │   └── images/
    │       └── logo.png    # Images and media
    ├── _config.yml         # Jekyll configuration (if using Jekyll)
    └── README.md           # Repository documentation

---

## 4. Custom Domains

### 4.1. Domain Configuration

1. **Purchase Domain**: Buy a domain from a registrar
2. **Configure DNS**: Set up DNS records
3. **Add to GitHub**:
   - Go to repository **"Settings"** → **"Pages"**
   - Add custom domain in **"Custom domain"** field
   - Save settings

### 4.2. DNS Configuration

**For Apex Domain (example.com):**

Add A records pointing to GitHub Pages IP addresses:

    A    @    185.199.108.153
    A    @    185.199.109.153
    A    @    185.199.110.153
    A    @    185.199.111.153

**For Subdomain (www.example.com):**

Add CNAME record:

    CNAME    www    username.github.io

### 4.3. HTTPS and Security

- **Automatic HTTPS**: Enabled by default for GitHub domains
- **Custom Domain HTTPS**: Available after domain verification
- **Security Headers**: Configure in Jekyll or HTML meta tags
- **Content Security Policy**: Implement for enhanced security

---

## 5. Advanced Configuration

### 5.1. GitHub Actions for Pages

* Use GitHub Actions for advanced deployment:

    ```yaml
    name: Deploy Pages
    on:
      push:
        branches: [ main ]
      pull_request:
        branches: [ main ]

    permissions:
      contents: read
      pages: write
      id-token: write

    concurrency:
      group: "pages"
      cancel-in-progress: true

    jobs:
      build:
        runs-on: ubuntu-latest
        steps:
          - name: Checkout
            uses: actions/checkout@v4
            
          - name: Setup Node.js
            uses: actions/setup-node@v4
            with:
              node-version: '18'
              
          - name: Install dependencies
            run: npm install
            
          - name: Build site
            run: npm run build
            
          - name: Upload artifact
            uses: actions/upload-pages-artifact@v2
            with:
              path: './dist'

      deploy:
        environment:
          name: github-pages
          url: ${{ steps.deployment.outputs.page_url }}
        runs-on: ubuntu-latest
        needs: build
        steps:
          - name: Deploy to GitHub Pages
            id: deployment
            uses: actions/deploy-pages@v2

### 5.2. Framework Integration

**React Application:**

    # Install and build
    npm install
    npm run build
    
    # GitHub Actions deployment
    - name: Build React App
      run: npm run build
    - name: Deploy
      uses: actions/upload-pages-artifact@v2
      with:
        path: './build'

**Vue.js Application:**

    # Build configuration
    module.exports = {
      publicPath: process.env.NODE_ENV === 'production'
        ? '/repository-name/'
        : '/',
      outputDir: 'dist'
    }

**Angular Application:**

    # Build command
    ng build --prod --base-href /repository-name/

### 5.3. Performance Optimization

**Image Optimization:**

- Use WebP format when possible
- Compress images appropriately
- Implement lazy loading
- Use responsive image techniques

**Asset Optimization:**

- Minify CSS and JavaScript
- Use CDNs for external libraries
- Implement caching strategies
- Optimize font loading

**SEO Configuration:**

    <!-- In HTML head -->
    <meta name="description" content="Project description">
    <meta name="keywords" content="keyword1, keyword2">
    <meta property="og:title" content="Project Title">
    <meta property="og:description" content="Project description">
    <meta property="og:image" content="image-url">

---

## 7. Documentation Sites

### 7.1. Documentation Themes

**Just the Docs:**

    # _config.yml
    remote_theme: pmarsceill/just-the-docs
    
    # Enable search
    search_enabled: true
    
    # Navigation structure
    nav_sort: case_insensitive

**GitBook Style:**

    # _config.yml
    remote_theme: sighingnow/jekyll-theme-gitbook
    
    # Table of contents
    toc:
      enabled: true
      h_min: 1
      h_max: 3

### 7.2. API Documentation

**OpenAPI/Swagger Integration:**

    ---
    layout: page
    title: API Documentation
    ---

    <link rel="stylesheet" type="text/css" href="https://unpkg.com/swagger-ui-dist@3.25.0/swagger-ui.css" />
    <div id="swagger-ui"></div>
    <script src="https://unpkg.com/swagger-ui-dist@3.25.0/swagger-ui-bundle.js"></script>
    <script>
      SwaggerUIBundle({
        url: '/api/openapi.yaml',
        dom_id: '#swagger-ui',
        presets: [
          SwaggerUIBundle.presets.apis,
          SwaggerUIBundle.presets.standalone
        ]
      });
    </script>

---

## 8. Monitoring and Analytics

### 8.1. Google Analytics Setup

* Monitor your pages performance:

  - **Repository insights**: Traffic and referrers
  - **Pages analytics**: Page views and unique visitors
  - **Performance metrics**: Loading times and optimization

### 8.3. Custom Analytics

Implement custom tracking:

    // Track downloads
    document.querySelectorAll('a[href$=".zip"]').forEach(link => {
      link.addEventListener('click', () => {
        gtag('event', 'download', {
          'event_category': 'file',
          'event_label': link.href
        });
      });
    });

---

## 9. Best Practices

!!! success "GitHub Pages Best Practices"

    **Performance**

      - Optimize images and assets
      - Use CDNs for external resources
      - Implement caching strategies
      - Monitor loading times

    **SEO**

      - Use descriptive page titles
      - Add meta descriptions
      - Implement structured data
      - Create XML sitemaps

    **Accessibility**

      - Use semantic HTML
      - Provide alt text for images
      - Ensure keyboard navigation
      - Test with screen readers

    **Maintenance**

      - Keep dependencies updated
      - Regular content reviews
      - Monitor broken links
      - Backup important content

---

## 10. Troubleshooting

### Common Issues

**Site Not Building:**

  - Check Jekyll build errors in repository **"Actions"** tab
  - Verify `_config.yml` syntax
  - Ensure all required files are present
  - Check for plugin compatibility

**Custom Domain Issues:**

  - Verify DNS configuration
  - Check domain verification status
  - Ensure HTTPS is properly configured
  - Wait for DNS propagation (up to 24 hours)

**Performance Problems:**

  - Optimize image sizes
  - Minimize CSS and JavaScript
  - Reduce external dependencies
  - Use appropriate caching headers

---

## Summary

You now understand how to:

&emsp;&emsp;✅&emsp;Set up GitHub Pages for static website hosting  
&emsp;&emsp;✅&emsp;Configure Jekyll for dynamic content generation  
&emsp;&emsp;✅&emsp;Use custom domains with HTTPS support  
&emsp;&emsp;✅&emsp;Create documentation and project websites  
&emsp;&emsp;✅&emsp;Implement advanced deployment workflows  
&emsp;&emsp;✅&emsp;Optimize performance and SEO  
&emsp;&emsp;✅&emsp;Monitor analytics and site performance  
