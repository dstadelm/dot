#include <map>
#include <iostream>
#include <memory>
using namespace std;
class B {
  public:
  static int num;
  int thisNum;
  B(){
    thisNum = num;
    num++;
  }
  B(const B* other){
    thisNum = other->thisNum;
  }
  void print(){
    cout << "Instance " << thisNum << endl;
  }
};

class A {
  public:
  typedef shared_ptr<B> Ptr;
  map<int, A::Ptr> myMap;
  A(){
    myMap[0] = make_shared<B>();
    myMap[1] = make_shared<B>();
    myMap[2] = make_shared<B>();
  }
  void print(){
    for ( auto const& c: myMap ){
      c.second->print();
    }
  }
};

int B::num = 0;

int main (){
  auto_ptr<A> myA(new A());
  myA->print();

}

