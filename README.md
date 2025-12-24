# PHP CI Base Image (Framework-Agnostic)

A production-ready PHP Docker base image designed for **CI/CD pipelines**, optimized for modern PHP applications and compatible with multiple frameworks such as **Laravel**, **Slim**, **Symfony**, and **plain PHP projects**.

This repository focuses on **performance, security, and best practices** for continuous integration workflows, without coupling the image to a specific framework or infrastructure.

---

## 🎯 Purpose

This project provides a **reusable PHP CI image** that:

- Eliminates repetitive environment setup in pipelines
- Speeds up builds by standardizing dependencies
- Encourages clean CI/CD architecture
- Can be reused across multiple projects and teams

It is intentionally **framework-agnostic** and **cloud-provider independent**.

---

## 🚀 Key Features

- PHP runtime with commonly required extensions
- Composer preinstalled
- Optimized for CI environments
- Compatible with:
  - Laravel
  - Slim Framework
  - Symfony
  - Custom / legacy PHP applications
- Ready for Bitbucket Pipelines, GitHub Actions, GitLab CI, etc.

---

## 🧱 Scope (Initial Version)

This initial version focuses on:

- Documentation and architectural intent
- CI-first mindset
- Clean separation between **build**, **test**, and **deploy** responsibilities

> Implementation details (Dockerfile, pipelines, caching) will be added incrementally following best practices.

---

## 🧩 What This Image Is NOT

- ❌ A production runtime image
- ❌ A framework-specific container
- ❌ A replacement for docker-compose or Kubernetes setups

This image is **strictly designed for CI/CD pipelines**.

---

## 🔀 Branch Strategy

This repository follows a **professional Git workflow**:

| Branch   | Purpose |
|--------|--------|
| `develop` | Continuous Integration (tests, lint, validation) |
| `main`    | Stable releases and production-ready artifacts |

> CI pipelines are expected to run on `develop`, while `main` represents validated and release-ready states.

---

## 🔐 Security Considerations

- No secrets are stored in this repository
- Environment variables must be injected via CI/CD tools
- `.env` files are intentionally excluded from version control

---

## 📦 Typical Use Cases

- PHP CI pipelines
- Automated testing environments
- Composer dependency validation
- Static analysis and quality gates
- Multi-project standardization

---

## 🛠️ Planned Roadmap

The following improvements will be delivered incrementally:

- [x] Base Dockerfile with PHP + extensions
- [x] Composer dependency caching
- [x] Multi-stage build optimization
- [x] Example CI pipelines (Bitbucket / GitHub)
- [x] Versioned Docker tags
- [ ] Documentation for framework-specific usage

---

## 🧪 Example CI Usage (Conceptual)

```yaml
pipelines:
  branches:
    develop:
      - step:
          name: Run Tests
          image: php-ci-base:latest
          script:
            - composer install
            - php artisan test
