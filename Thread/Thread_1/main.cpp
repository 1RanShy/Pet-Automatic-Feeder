#include <iostream>

int main() {
    std::string input;

    std::cout << "请输入一些内容：";
    std::getline(std::cin, input);

    std::cout << "您输入的内容是：" << input << std::endl;

    return 0;
}