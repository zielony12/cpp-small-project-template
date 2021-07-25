#include <iostream>
#include <sample/Test.hpp>

Test::Test(std::string x) {
	this->x = x;
}

void Test::test() {
	std::cout << x << std::endl;
}
