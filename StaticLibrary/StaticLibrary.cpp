#include <iostream>
#include <Windows.h>
#pragma warning(disable: 4996)

extern "C" {
	void BREAKL() {
		std::cout << std::endl;
	}

	void OutputInt(int a) {
		std::cout << a;
	}

	void OutputStr(char* ptr) { 
		SetConsoleCP(1251);
		SetConsoleOutputCP(1251);
		if (ptr == nullptr) {
			std::cout << std::endl;
			return;
		}
		for (int i = 0; ptr[i] != '\0'; i++)
			std::cout << ptr[i];
	}

	void OutputIntLn(int a) {
		std::cout << a << std::endl;
	}

	void OutputStrLn(char* ptr) {
		OutputStr(ptr);
		std::cout << std::endl;
	}

	int slen(char* ptr) {
		return strlen(ptr);
	}

	int strtobyte(char* number) {
		int res = 0;// преобр стр в число 
		for (; *number; res += *number++ - '0')
			res *= 10;
		return res;
	}
}