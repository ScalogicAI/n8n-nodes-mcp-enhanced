# Upstream Integration Guide

This guide explains how to manage updates from the original n8n-nodes-mcp repository while preserving your enhanced features.

## 📍 Current Status

- **Upstream Repository**: https://github.com/nerding-io/n8n-nodes-mcp
- **Original Author**: Jd Fiscus (@nerding-io)
- **Your Enhanced Version**: `@scalogicai/n8n-nodes-mcp-enhanced`
- **Upstream Remote**: Already configured as `upstream`

## 🔧 Your Enhanced Features (What to Preserve)

### **Key Modifications to Protect:**
1. **Prompt Parameters**: JSON parameter support in `getPrompt` operation
2. **Tenant ID Support**: Multi-tenant server compatibility
3. **Enhanced Validation**: Additional JSON parameter validation
4. **UI Fields**: Extra form fields for parameters and tenant ID
5. **Package Naming**: All "Enhanced" branding and naming

### **Files with Your Enhancements:**
- `nodes/McpClient/McpClientEnhanced.node.ts` (lines 197-220, 655-685)
- `credentials/*Enhanced*.credentials.ts` (all Enhanced credential files)
- `package.json` (name, description, version)
- `README.md` (your comprehensive documentation)

## 🚀 Safe Update Workflow

### **Monthly Update Check (Recommended)**

```bash
# 1. Fetch latest upstream changes
git fetch upstream

# 2. Check what's new since last check
git log upstream/main --oneline --since="1 month ago"

# 3. See which files changed
git diff --name-only main upstream/main

# 4. Review specific changes
git log upstream/main ^main --oneline
```

### **When You Find Updates to Integrate**

#### **Step 1: Create Test Branch**
```bash
# Create a safe testing branch
git checkout -b upstream-integration-test

# Try merging upstream changes
git merge upstream/main
```

#### **Step 2: Resolve Conflicts (If Any)**
If conflicts occur, they'll likely be in these areas:
- Package.json (keep your name/version)
- Node files (preserve your enhanced features)
- Credential files (keep your Enhanced naming)

#### **Step 3: Test Your Features**
```bash
# Build and test
npm run build
npm run lint
npm test

# Verify your enhancements still work:
# - Prompt parameters
# - Tenant ID support
# - Enhanced validation
```

#### **Step 4: Merge or Abandon**
```bash
# If everything works:
git checkout main
git merge upstream-integration-test
git branch -D upstream-integration-test

# If problems found:
git checkout main
git branch -D upstream-integration-test
# Try selective cherry-picking instead
```

## 🎯 What to Merge Immediately

### **Always Safe to Merge:**
- ✅ Security fixes
- ✅ Bug fixes in core functionality
- ✅ Dependency updates (`@modelcontextprotocol/sdk`, etc.)
- ✅ n8n compatibility improvements
- ✅ New transport methods (HTTP Streamable updates)

### **Evaluate Carefully:**
- 🤔 UI changes (might affect your additional fields)
- 🤔 Major refactors (could break your enhancements)
- 🤔 New features (might conflict with yours)

### **Never Merge (Keep Yours):**
- ❌ Package naming/branding
- ❌ Your enhanced functionality
- ❌ Your comprehensive README

## 🔍 Selective Cherry-Picking

For specific commits that don't merge cleanly:

```bash
# Pick specific commits
git cherry-pick <commit-hash>

# For commits that conflict, resolve manually:
git cherry-pick <commit-hash>
# Fix conflicts in editor
git add .
git cherry-pick --continue
```

## 📊 Monitoring Strategy

### **Set Up Notifications:**

#### **Option 1: GitHub Watch**
1. Go to https://github.com/nerding-io/n8n-nodes-mcp
2. Click "Watch" → "Custom" → "Releases"
3. You'll get emails for new versions

#### **Option 2: Automated Checking**
Create a monthly reminder to run:
```bash
cd /home/ubuntu/mcp-servers/n8n-nodes/n8n-nodes-mcp-enhanced
git fetch upstream
git log upstream/main --oneline --since="1 month ago"
```

## 🚨 Emergency Updates

For critical security or compatibility fixes:

```bash
# Immediate check
git fetch upstream
git log upstream/main --oneline --since="1 week ago"

# If urgent fix found, test quickly:
git checkout -b emergency-fix
git cherry-pick <urgent-commit-hash>
npm run build && npm test

# If works:
git checkout main
git merge emergency-fix
npm version patch
npm publish
git push origin main
```

## 📋 Integration Checklist

### **Before Merging Any Updates:**
- [ ] Backup current working version
- [ ] Create test branch
- [ ] Review all changed files
- [ ] Check for conflicts with your enhancements
- [ ] Test build process
- [ ] Verify your features still work
- [ ] Run full test suite

### **After Successful Integration:**
- [ ] Update version number
- [ ] Update README if needed
- [ ] Commit changes with clear message
- [ ] Push to GitHub
- [ ] Publish to npm (if stable)
- [ ] Tag release

## 🛠️ Quick Commands Reference

```bash
# Check upstream status
git fetch upstream && git log upstream/main --oneline -5

# Compare with upstream
git diff main upstream/main --name-only

# See your unique commits
git log --oneline main ^upstream/main

# See upstream commits you don't have
git log --oneline upstream/main ^main

# Safe test merge
git checkout -b test-merge && git merge upstream/main

# Cherry-pick specific fix
git cherry-pick <commit-hash>

# Abort problematic merge
git merge --abort

# Check what remotes you have
git remote -v
```

## 📝 Example Integration Session

```bash
# Monthly check (1st of each month)
git fetch upstream
git log upstream/main --oneline --since="1 month ago"

# Found new bug fix - let's integrate it
git checkout -b upstream-bugfix-202501
git cherry-pick abc1234  # the bug fix commit

# Test it
npm run build
npm run lint

# Looks good, merge it
git checkout main
git merge upstream-bugfix-202501
git branch -D upstream-bugfix-202501

# Update and publish
npm version patch
git push origin main
npm publish
```

## ⚠️ Red Flags - Don't Merge These

If you see upstream changes that:
- Modify the same lines where you added prompt parameters
- Change credential naming conventions
- Alter package.json in ways that conflict with your branding
- Remove functionality you depend on

**→ Use cherry-picking or manual integration instead**

## 📞 When You Need Help

If you encounter complex merge conflicts:
1. Document the conflicts
2. Test on a branch first
3. Consider reaching out to original author for guidance
4. Worst case: manually apply changes to preserve your features

---

**Last Updated**: January 2025  
**Upstream Version Tracked**: v0.1.28  
**Your Version**: v1.0.4