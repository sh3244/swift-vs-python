#include<iostream>

#define TIMES 10000000  //add num times you want to run

using namespace std;

uint32_t arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};


void calcuC(uint32_t v,int length)
{
    for(uint8_t ctr = length; ctr > 0; --ctr)
        for(uint32_t lpc = 1000000; lpc != 0; --lpc)
            v[ctr] += 1;
}


int main() {
    setbuf(stdout,NULL);
    calcuC(v,10);
    
    for (const auto i: v)
      cout << i << ' ';
      
    return 0;
}
