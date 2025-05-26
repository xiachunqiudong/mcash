#include <iostream>
#include <mcash_utils.h>

int ccFunc() {
  std::cout << "hello from cpp" << std::endl;
  return 0;
}


extern "C" {

  int cFunc() {return ccFunc();}

}
