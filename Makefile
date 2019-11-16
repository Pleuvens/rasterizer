INCLUDE_DIRS= -Ienv/libs/aunit/include/aunit/containers/ \
              -Ienv/libs/aunit/include/aunit/framework/ \
              -Ienv/libs/aunit/include/aunit/framework/calendar/ \
              -Ienv/libs/aunit/include/aunit/framework/fullexception/ \
              -Ienv/libs/aunit/include/aunit/framework/staticmemory/ \
              -Ienv/libs/aunit/include/aunit/reporters/ \
              -Isrc/vector \
              -Itest/

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
		 test_suite \
		 tests

BIN= tests

check:
	. env/env.sh 
	gnatmake -D 'build' $(INCLUDE_DIRS) $(SRC)
	gnat bind build/tests
	gnat link build/tests

clean:
	rm build/* $(BIN)
