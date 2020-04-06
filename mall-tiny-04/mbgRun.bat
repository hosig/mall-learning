@ECHO OFF
chcp 65001

REM Note1: Don't use cd, for it will not change disk-driver for you.
REM NOte2: This is the root dir, the path in "mall-tiny-04\src\main\resources\generatorConfig.xml" use this as rootDIR.
REM        so if you change here, you should change relative paths wrote in genereatorConfig.xml.
pushd "K:\g\Hg\java\spring\mall-learning"

REM DO NOT doublequote ....*.java
"C:/Program Files/Java/jdk1.8.0_181/bin/javac" -encoding utf8 -cp "C:/Users/sei/.m2/repository/org/mybatis/generator/mybatis-generator-core/1.3.3/mybatis-generator-core-1.3.3.jar" -d "K:/g/Hg/java/spring/mall-learning/mall-tiny-04/target/classes" K:\g\Hg\java\spring\mall-learning\mall-tiny-04\src\main\java\com\macro\mall\tiny\mbg\*.java

REM the next line may be needed or not. 
REM rmdir /Q /S  "K:\g\Hg\java\spring\mall-learning\mall-tiny-04\target\classes\com\macro\mall\tiny\mbg\mapper"

REM if not delete as below, the generated \resources\com\macro\mall\tiny\mbg\mapper\*.xml will append to the original one
rmdir /Q /S  "K:\g\Hg\java\spring\mall-learning\mall-tiny-04\src\main\resources\com\macro\mall\tiny\mbg\mapper"
REM         /Y           Suppresses prompting to confirm you want to overwrite an existing destination file.
xcopy K:\g\Hg\java\spring\mall-learning\mall-tiny-04\src\main\resources\generatorConfig.* K:\g\Hg\java\spring\mall-learning\mall-tiny-04\target\classes\ /Y

"C:/Program Files/Java/jdk1.8.0_181/bin/java" -cp ".;./mall-tiny-04/target/classes;C:/Users/sei/.m2/repository/org/mybatis/generator/mybatis-generator-core/1.3.3/mybatis-generator-core-1.3.3.jar;C:\Users\sei\.m2\repository\mysql\mysql-connector-java\8.0.15\mysql-connector-java-8.0.15.jar" com.macro.mall.tiny.mbg.Generator

REM tell intellij the process suceeded.
exit 0
