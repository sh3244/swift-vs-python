#include<iostream>
#include <vector>

#define TIMES 10000000  //add num times you want to run

using namespace std;

vector<int> v {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
vector<int>::iterator ptr;

void calcuC(vector<int> &v, int length)
{

    for(uint8_t ctr = length; ctr != 0; --ctr)
        for(uint32_t lpc = TIMES; lpc != 0; --lpc)
            v[ctr-1] += 1;


    // _asm
    // {
    //     mov edi,TIMES
    //     start:
    //     mov esi,0
    //     mov ecx,lengthOfArray
    //     label:
    //     mov edx,x
    //     push edx
    //     mov eax,DWORD PTR [edx + esi*4]
    //     mov edx,y
    //     mov ebx,DWORD PTR [edx + esi*4]
    //     add eax,ebx
    //     pop edx
    //     mov [edx + esi*4],eax
    //     inc esi
    //     loop label
    //     dec edi
    //     cmp edi,0
    //     jnz start
    // };

}

int main() {
    setbuf(stdout, NULL);
    calcuC(v, 10);
    
    cout << "[";
    for (const auto i: v) {
        if (i == v[v.size() - 1]) {
            cout << i << "]";
        } else {
            cout << i << ", ";
        }
    }
      
    return 0;
}
