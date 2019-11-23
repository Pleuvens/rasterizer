TEST_INCLUDE_DIRS= -Ienv/libs/aunit/include/aunit/containers/ \
              -Ienv/libs/aunit/include/aunit/framework/ \
              -Ienv/libs/aunit/include/aunit/framework/calendar/ \
              -Ienv/libs/aunit/include/aunit/framework/fullexception/ \
              -Ienv/libs/aunit/include/aunit/framework/staticmemory/ \
              -Ienv/libs/aunit/include/aunit/reporters/ \
              -Itest/ \
              -Itest/vector \
              -Itest/color \
              -Itest/triangles \
              -Itest/scene

INCLUDE_DIRS= -Isrc/vector \
              -Isrc/color \
              -Isrc/triangles \
              -Isrc/scene \
	      -Itest/main

TEST_SRC= ada_containers.ads aunit \
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
		 vector_test \
		 vector_test_suite \
		 color_test \
		 color_test_suite \
		 triangle_test \
		 triangle_test_suite \
		 scene_test \
		 scene_test_suite \
		 test_suite \
		 tests

SRC= vector \
     color \
     triangle \
     scene \
     simple_triangle

ALL_BIN= tests simple_triangle

all:
	gnatmake -D 'build' $(INCLUDE_DIRS) $(SRC)
	gnat bind build/simple_triangle
	gnat link build/simple_triangle

check:
	gnatmake -D 'build' $(INCLUDE_DIRS) $(TEST_INCLUDE_DIRS) $(SRC) $(TEST_SRC)
	gnat bind build/tests
	gnat link build/tests
	./tests

clean:
	rm build/* $(ALL_BIN)
