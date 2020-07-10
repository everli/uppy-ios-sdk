# Declare file names
TARGET_NAME="Uppy"
MODULE_NAME="Uppy.swiftmodule"
FRAMEWORK_NAME="Uppy.framework"
PROJECT_NAME="Uppy.xcodeproj"

# remove existing framework
rm -rf ${FRAMEWORK_NAME}

# create build folder
mkdir build

# build framework for iPhoneSimulator
xcodebuild clean build \
  -project ${PROJECT_NAME} \
  -scheme ${TARGET_NAME} \
  -configuration Release \
  -sdk iphonesimulator \
  -derivedDataPath derived_data

# create folder to store compiled framework for iPhoneSimulator
mkdir build/simulator

# copy compiled framework for iPhoneSimulator into  build folder
cp -r derived_data/Build/Products/Release-iphonesimulator/${FRAMEWORK_NAME} build/simulator

# build framework for iPhoneOS
xcodebuild clean build \
  -project ${PROJECT_NAME} \
  -scheme ${TARGET_NAME} \
  -configuration Release \
  -sdk iphoneos \
  -derivedDataPath derived_data

# create folder to store compiled framework for iPhoneOS
mkdir build/devices

# copy compiled framework for iPhoneOS into build folder
cp -r derived_data/Build/Products/Release-iphoneos/${FRAMEWORK_NAME} build/devices

####################### Create universal framework #############################

# copy device framework into root folder
cp -r build/devices/${FRAMEWORK_NAME} .

# create binary framework compatible with iPhoneSimulator and iPhoneOS
lipo -create \
  build/simulator/${FRAMEWORK_NAME}/${TARGET_NAME} \
  build/devices/${FRAMEWORK_NAME}/${TARGET_NAME} \
  -output ${FRAMEWORK_NAME}/${TARGET_NAME}

# copy simulator Swift public interface to universal framework
cp build/simulator/${FRAMEWORK_NAME}/Modules/${MODULE_NAME}/* ${FRAMEWORK_NAME}/Modules/${MODULE_NAME}

# remove foldera
rm -rf build/
rm -rf derived_data

# Print completion message
echo "\n💥 Completed Building Universal Binary Framework\n"
