***SCM***
yum install git -y
git config --global user.name "navypandora"
git config --global user.email "kanishk.godha@live.com"
git clone 

***build-automation***
we will be using gradle
wget https://services.gradle.org/distributions/gradle-4.7-bin.zip
yum install -y unzip java-1.8.0-openjdk
mkdir /opt/gradle
unzip -d /opt/gradle/ ~/gradle-4.7-bin.zip
add this to the path

mkdir /myproj
cd /myproj
graddle wrapper (this will add graddle files to your project)

./gradelw build (this command will install the required graddle if not installed in your environment)

cd /project
gradle init
vim build.gradle:
	task sayhello << {
        println "Hello, world"
	}
	task anotherTask << {
	        println "new one"
	}

	sayhello.dependsOn anothertask


./gradlew sayhello anotherTask (will perform both tasks from build.gradle file)
./gradlew sayhello (will perform both tasks since sayhello dependsOn anothertask)
 (build depends on zip, zip dependsOn npm_build, npm_build dependsOn npm_test, npm_test dependsOn npmInstall)

