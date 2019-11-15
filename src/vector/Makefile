test:
	. ../../env/env.sh 
	gcc -c -I../../env/libs/aunit/include/aunit/containers/ -I- ../../env/libs/aunit/include/aunit/containers/ada_containers.ads
	gcc -c -I../../env/libs/aunit/include/aunit/framework/ -I- ../../env/libs/aunit/include/aunit/framework/aunit.adb
	gcc -c -I../../env/libs/aunit/include/aunit/framework/calendar/ -I../../env/libs/aunit/include/aunit/framework/  -I- ../../env/libs/aunit/include/aunit/framework/calendar/aunit-time_measure.adb
	gcc -c -I../../env/libs/aunit/include/aunit/framework/ -I../../env/libs/aunit/include/aunit/containers/ -I../../env/libs/aunit/include/aunit/framework/calendar/ -I../../env/libs/aunit/include/aunit/framework/fullexception/ -I../../env/libs/aunit/include/aunit/framework/staticmemory/  -I- ../../env/libs/aunit/include/aunit/framework/aunit-assertions.adb
	gcc -c -I../../env/libs/aunit/include/aunit/framework/ -I../../env/libs/aunit/include/aunit/containers/ -I../../env/libs/aunit/include/aunit/framework/calendar/ -I../../env/libs/aunit/include/aunit/framework/staticmemory/ -I../../env/libs/aunit/include/aunit/framework/certexception/ -I- ../../env/libs/aunit/include/aunit/framework/aunit-test_cases.adb
	gnat compile vector
	gcc -c -I../../env/libs/aunit/include/aunit/framework/ -I../../env/libs/aunit/include/aunit/containers/ -I../../env/libs/aunit/include/aunit/framework/calendar/ vector_test.adb
