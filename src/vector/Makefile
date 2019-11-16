INCLUDE_DIRS= -I../../env/libs/aunit/include/aunit/containers/ \
              -I../../env/libs/aunit/include/aunit/framework/ \
              -I../../env/libs/aunit/include/aunit/framework/calendar/ \
              -I../../env/libs/aunit/include/aunit/framework/fullexception/ \
              -I../../env/libs/aunit/include/aunit/framework/staticmemory/ \
              -I../../env/libs/aunit/include/aunit/reporters/

SRC= ada_containers.ads aunit \
		 aunit \
		 aunit-time_measure \
		 aunit-assertions \
		 aunit-test_cases \
		 ada_containers-aunit_lists \
		 aunit-memory \
		 aunit-memory-utils \
		 aunit-test_results \
		 aunit-tests \
		 aunit-options \
		 aunit-test_filters \
		 aunit-simple_test_cases \
		 aunit-reporter \
		 aunit-run \
		 aunit-test_caller \
		 aunit-test_suites \
		 aunit-test_fixtures \
		 aunit-reporter-text \
		 vector \
		 vector_test \
		 vector_test_suite \
		 v_tests

test:
	. ../../env/env.sh 
	gnatmake $(INCLUDE_DIRS) $(SRC)
	gnat bind v_tests
	gnat link v_tests

clean:
	rm *.ali *.o v_tests
