echo "----------------------------------------";
echo "⬇️  Updating gem";
echo "----------------------------------------";

sudo gem update --system

echo "----------------------------------------";
echo "⬇️  Installing brew";
echo "----------------------------------------";

/usr/bin/ruby \
-e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
< /dev/null

echo "----------------------------------------";
echo "⬇️  Installing carthage";
echo "----------------------------------------";

brew install carthage

echo "----------------------------------------";
echo "⬇️  Execute carthage";
echo "----------------------------------------";

carthage update --platform iOS
