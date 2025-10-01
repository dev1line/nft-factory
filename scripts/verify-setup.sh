#!/bin/bash

# Verification script to ensure all necessary files are present for setup

echo "🔍 Verifying TON NFT DApp setup configuration..."
echo ""

EXIT_CODE=0

# Check for required files
echo "📁 Checking required files..."

# Check patch file
if [ -f "patches/@ton+blueprint+0.16.0.patch" ]; then
    echo "✅ Patch file exists: patches/@ton+blueprint+0.16.0.patch"
else
    echo "❌ Missing: patches/@ton+blueprint+0.16.0.patch"
    EXIT_CODE=1
fi

# Check package.json has postinstall script
if grep -q "\"postinstall\".*\"patch-package\"" package.json; then
    echo "✅ postinstall script configured in package.json"
else
    echo "❌ Missing postinstall script in package.json"
    EXIT_CODE=1
fi

# Check setup.sh
if [ -f "setup.sh" ]; then
    echo "✅ Setup script exists: setup.sh"
    if [ -x "setup.sh" ]; then
        echo "✅ setup.sh is executable"
    else
        echo "⚠️  setup.sh is not executable. Run: chmod +x setup.sh"
    fi
else
    echo "❌ Missing: setup.sh"
    EXIT_CODE=1
fi

# Check SETUP.md
if [ -f "SETUP.md" ]; then
    echo "✅ Setup documentation exists: SETUP.md"
else
    echo "❌ Missing: SETUP.md"
    EXIT_CODE=1
fi

# Check if patch-package is in dependencies
if grep -q "patch-package" package.json; then
    echo "✅ patch-package is in dependencies"
else
    echo "❌ Missing patch-package in dependencies"
    EXIT_CODE=1
fi

echo ""
echo "📦 Checking git status for important files..."

# Check if patches directory is tracked
if git ls-files --error-unmatch patches/ &> /dev/null; then
    echo "✅ patches/ directory is tracked by git"
else
    echo "⚠️  patches/ directory is NOT tracked by git"
    echo "   Run: git add patches/"
    EXIT_CODE=1
fi

# Check if setup files are tracked
for file in "setup.sh" "SETUP.md" "package.json"; do
    if git ls-files --error-unmatch "$file" &> /dev/null; then
        echo "✅ $file is tracked by git"
    else
        echo "⚠️  $file is NOT tracked by git"
        echo "   Run: git add $file"
        EXIT_CODE=1
    fi
done

echo ""
if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ All setup files are present and configured correctly!"
    echo ""
    echo "🎯 Next steps:"
    echo "   1. Commit the changes:"
    echo "      git add patches/ setup.sh SETUP.md package.json README.md"
    echo "      git commit -m 'Configure custom TON Connect manifest URL'"
    echo ""
    echo "   2. Push to repository:"
    echo "      git push origin main"
    echo ""
    echo "   3. On other machines, simply run:"
    echo "      git pull"
    echo "      ./setup.sh"
else
    echo "❌ Some setup files are missing or not configured correctly."
    echo "   Please review the errors above."
fi

exit $EXIT_CODE

