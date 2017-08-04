original_string="$1"
shift;

#BUNDLE_ID (bid)
bundleId="${PRODUCT_BUNDLE_IDENTIFIER}"

#PRODUCT_NAME (pn)
productName="${PRODUCT_NAME}"

#VERSION (vn)
versionNumber=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "${PROJECT_DIR}/${INFOPLIST_FILE}")

#BUILD (bn)
buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}")

#TARGET_NAME (tn)
targetName="${TARGET_NAME}"


#ARGUMENTS
counter=0
while ((counter < $#)); do

	replacer="na"
	if [[ $1 == "vn" ]]; then
		replacer=$versionNumber
	elif [[ $1 == "bn" ]]; then
		replacer=$buildNumber
	elif [[ $1 == "tn" ]]; then
		replacer=$targetName
	elif [[ $1 == "pn" ]]; then
		replacer=$productName
	elif [[ $1 == "bid" ]]; then
		replacer=$bundleId
	fi

	a=$(echo $original_string | awk -v replacer="$replacer" '{sub(/%@/,replacer)}1')
	original_string=$a
	shift;
  	((counter++))
done;

#DRAWING
label_name=${BASH_ARGV[0]}

sed -i bak -e "/userLabel=\"$label_name\"/s/text=\"[^\"]*\"/text=\"$original_string\"/" $PROJECT_NAME/Base.lproj/LaunchScreen.storyboard


