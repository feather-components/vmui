#!/usr/bin/env sh

currentVersion=`grep '"version":' package.json | cut -d '"' -f 4`
#arr=(${currentVersion//./ }) 
#((arr[2]=arr[2]+1))
#nextVersion="${arr[0]}.${arr[1]}.${arr[2]}"

if [[ $NODE_ENV != 'ci' ]]
then
    echo -n "Version: (${nextVersion}) "
    read VERSION
fi

if [[ "$VERSION" != "" ]]
then
    sed -i "s/\"version\".*/\"version\": \"${VERSION}\",/" package.json
else
    VERSION=$nextVersion
fi

cat package.json > bower.json
echo "building...."
webpack
echo "complete!"
git add -A 
git commit -m "publish ${VERSION}"
git tag -m -a "${VERSION}"
git push origin --force $VERSION:$VERSION