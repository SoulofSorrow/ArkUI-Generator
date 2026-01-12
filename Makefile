.PHONY: help setup install-hooks install-editorconfig install-gitignore install-dockerignore clean all check-git set-git-local test-hook info

GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m

GIT_USER := SoulofSorrow
GIT_EMAIL := julian.schaefer@xmail.dev

help:
	@echo "Verfügbare Targets:"
	@echo "  setup                 - Komplettes Setup"
	@echo "  install-editorconfig  - Erstellt .editorconfig"
	@echo "  install-gitignore     - Erstellt .gitignore"
	@echo "  install-dockerignore  - Erstellt .dockerignore"
	@echo "  install-hooks         - Installiert Pre-Commit Hook"
	@echo "  set-git-local         - Setzt Git-Config"
	@echo "  check-git             - Prüft Git-Config"
	@echo "  test-hook             - Testet Hook"
	@echo "  info                  - Projekt-Info"
	@echo "  clean                 - Aufräumen"

all: setup

setup: install-editorconfig install-gitignore install-dockerignore install-hooks
	@echo "Setup abgeschlossen!"

install-editorconfig:
	@echo "Erstelle .editorconfig..."
	@printf 'root = true\n#####################################################\n# Globale Standardwerte\n#####################################################\n[*]\ncharset = utf-8\nend_of_line = lf\nindent_size = 2\nindent_style = space\ninsert_final_newline = true\nmax_line_length = 160\ntrim_trailing_whitespace = true\n#####################################################\n# CI/CD & Build-Skripte\n#####################################################\n[Jenkinsfile]\nindent_size = 4\n[Jenkinsfile.*]\nindent_size = 4\n[Makefile]\nindent_size = 4\nindent_style = tab\n#####################################################\n# Markdown / Text / Dokumentation\n#####################################################\n[*.md]\ntrim_trailing_whitespace = false\nmax_line_length = off\n[*.rst]\nindent_size = 2\nindent_style = space\ntrim_trailing_whitespace = false\n#####################################################\n# Konfigurationsformate\n#####################################################\n[*.yml]\nindent_size = 2\nindent_style = space\n[*.yaml]\nindent_size = 2\nindent_style = space\n[.github/*.yml]\nindent_size = 2\nindent_style = space\n[.github/*.yaml]\nindent_size = 2\nindent_style = space\n[Dockerfile]\nindent_size = 2\nindent_style = space\n[Dockerfile.*]\nindent_size = 2\nindent_style = space\n[.env]\nindent_size = 2\nindent_style = space\ntrim_trailing_whitespace = false\n[*.env]\nindent_size = 2\nindent_style = space\ntrim_trailing_whitespace = false\n[*.json]\nindent_size = 2\nindent_style = space\n[*.toml]\nindent_size = 2\nindent_style = space\ntrim_trailing_whitespace = false\n[*.ini]\nindent_size = 2\nindent_style = space\ntrim_trailing_whitespace = false\n#####################################################\n# Programmierung\n#####################################################\n[*.py]\nindent_size = 4\nindent_style = space\n[*.sh]\nindent_size = 2\nindent_style = space\n[*.java]\nindent_size = 4\nindent_style = space\n[*.kt]\nindent_size = 4\nindent_style = space\n[*.groovy]\nindent_size = 4\nindent_style = space\n[*.js]\nindent_size = 2\nindent_style = space\n[*.ts]\nindent_size = 2\nindent_style = space\n[*.html]\nindent_size = 2\nindent_style = space\n[*.css]\nindent_size = 2\nindent_style = space\n[*.scss]\nindent_size = 2\nindent_style = space\n[*.xml]\nindent_size = 2\nindent_style = space\n[*.tf]\nindent_size = 2\nindent_style = space\n[*.php]\nindent_size = 4\nindent_style = space\n[*.rb]\nindent_size = 2\nindent_style = space\n[*.rs]\nindent_size = 4\nindent_style = space\n[*.c]\nindent_size = 4\nindent_style = space\n[*.cpp]\nindent_size = 4\nindent_style = space\n[*.h]\nindent_size = 4\nindent_style = space\n[*.go]\nindent_size = 4\nindent_style = tab\n[*.ps1]\nindent_size = 2\nindent_style = space\n[*.cs]\nindent_size = 4\nindent_style = space\n[*.pl]\nindent_size = 4\nindent_style = space\n#####################################################\n# Datenformate / Skripte\n#####################################################\n[*.sql]\nindent_size = 2\nindent_style = space\n[*.mod]\nindent_size = 2\nindent_style = space\n[*.sum]\nindent_size = 2\nindent_style = space\n' > .editorconfig
	@echo "Fertig!"

install-gitignore:
	@echo "Erstelle .gitignore..."
	@printf '# OS\n.DS_Store\nThumbs.db\n*~\n\n# IDEs\n.vscode/\n.idea/\n*.sublime-*\n\n# Python\n__pycache__/\n*.py[cod]\n.Python\nbuild/\ndist/\n*.egg-info/\n.pytest_cache/\n.coverage\n.env\n.venv\nvenv/\n\n# Node\nnode_modules/\nnpm-debug.log*\n\n# Java\n*.class\ntarget/\n.gradle/\n\n# Go\nvendor/\n\n# Rust\ntarget/\nCargo.lock\n\n# C/C++\n*.o\n*.so\n*.exe\n\n# Logs\n*.log\n\n# Secrets\n*.pem\n*.key\nsecrets.yml\n.envrc\n\n# Temp\n*.tmp\n*.bak\n*.swp\ntmp/\n' > .gitignore
	@echo "Fertig!"

install-dockerignore:
	@echo "Erstelle .dockerignore..."
	@printf '# Version Control\n.git\n.gitignore\n.github\n\n# CI/CD\nJenkinsfile*\n.gitlab-ci.yml\n\n# Docs\n*.md\n!README.md\ndocs/\n\n# IDEs\n.vscode/\n.idea/\n\n# OS\n.DS_Store\nThumbs.db\n\n# Python\n__pycache__/\n*.pyc\n.venv\nvenv/\n*.egg-info/\n\n# Node\nnode_modules/\n\n# Java\ntarget/\n.gradle/\n\n# Testing\ntest/\ntests/\n\n# Logs\n*.log\n\n# Temp\n*.tmp\n*.swp\n\n# Dev Tools\nMakefile\n.editorconfig\ndocker-compose.yml\n\n# Secrets\n*.pem\n*.key\n.env\n.env.*\n!.env.example\n' > .dockerignore
	@echo "Fertig!"

install-hooks:
	@echo "Installiere Git Hooks..."
	@if [ ! -d .git ]; then echo "Kein Git-Repo!"; exit 1; fi
	@mkdir -p .git/hooks
	@printf '#!/bin/bash\nEXPECTED_USER="SoulofSorrow"\nEXPECTED_EMAIL="julian.schaefer@xmail.dev"\nCURRENT_USER=$$(git config user.name)\nCURRENT_EMAIL=$$(git config user.email)\nif [ "$$CURRENT_USER" != "$$EXPECTED_USER" ] || [ "$$CURRENT_EMAIL" != "$$EXPECTED_EMAIL" ]; then\n  echo "Commit abgelehnt!"\n  echo "Erwartet: $$EXPECTED_USER <$$EXPECTED_EMAIL>"\n  echo "Aktuell:  $$CURRENT_USER <$$CURRENT_EMAIL>"\n  echo ""\n  echo "Korrigiere mit:"\n  echo "  git config --local user.name \\"$$EXPECTED_USER\\""\n  echo "  git config --local user.email \\"$$EXPECTED_EMAIL\\""\n  exit 1\nfi\necho "Git-Config OK"\nexit 0\n' > .git/hooks/pre-commit
	@chmod +x .git/hooks/pre-commit
	@echo "Hook installiert!"

check-git:
	@echo "Git-Konfiguration:"
	@echo "Aktuell:  $$(git config user.name) <$$(git config user.email)>"
	@echo "Erwartet: $(GIT_USER) <$(GIT_EMAIL)>"

set-git-local:
	@echo "Setze Git-Config..."
	@git config --local user.name "$(GIT_USER)"
	@git config --local user.email "$(GIT_EMAIL)"
	@echo "Fertig!"
	@$(MAKE) check-git

test-hook:
	@echo "Teste Hook..."
	@if [ -f .git/hooks/pre-commit ]; then bash .git/hooks/pre-commit; else echo "Hook nicht gefunden"; fi

info:
	@echo "Projekt-Info:"
	@echo "Git: $(GIT_USER) <$(GIT_EMAIL)>"
	@echo ""
	@[ -f .editorconfig ] && echo "✅ .editorconfig" || echo "❌ .editorconfig"
	@[ -f .gitignore ] && echo "✅ .gitignore" || echo "❌ .gitignore"
	@[ -f .dockerignore ] && echo "✅ .dockerignore" || echo "❌ .dockerignore"
	@[ -f .git/hooks/pre-commit ] && echo "✅ pre-commit" || echo "❌ pre-commit"

clean:
	@echo "Aufräumen..."
	@rm -f .editorconfig .gitignore .dockerignore .git/hooks/pre-commit
	@echo "Fertig!"
