- [Library generation](#org8c2de84)
  - [Build your own shared library](#org47c6c2c)
- [Built-in functions](#orge0001cd)
  - [Efficiency plots](#orgc8251be)
  - [User-defined functions in cling/rootcling](#orgcdbcb1d)
  - [How to generate string using `Form` and `Format`](#orga89ff87)
  - [How to add include path and load the libraries](#orgc0397e1)
  - [Colors in `ROOT`](#orgeca18f1)
    - [How to create a new color](#org9e5d889)
    - [Classifications](#org96200d4)
    - [Views and options](#org0f56988)



<a id="org8c2de84"></a>

# Library generation


<a id="org47c6c2c"></a>

## Build your own shared library

See this [post](https://root-forum.cern.ch/t/shared-libraries-interpreter-vs-compiled-macro/29389) and this [link](https://root.cern/manual/interacting_with_shared_libraries/). Make use of `rootcling` and `root-config` to generate `rootmap`. To make `rootmap` work, append the path to `rootmap` to `LD_LIBRARY_PATH` or its equivalence. My example codes are posted below.

<p class="verse">
.<br />
├── Linkdef.h<br />
├── Makefile<br />
├── Inner.cc<br />
├── Outer.cc<br />
├── Inner.h<br />
└── Outer.h<br />
</p>

```c++
/* Linkdef.h */
#ifdef __CLING__
#pragma link off all globals;
#pragma link off all classes;
#pragma link off all functions;
#pragma link C++ nestedclasses;

#pragma link C++ class Outer+;
#pragma link C++ class Inner+;

#endif
```

```shell
# Makefile
CXXFLAGS=-std=c++14 -fPIC -I$(shell root-config --incdir)
LDFLAGS=$(shell root-config --libs)
CXX=g++

all: libMyClass.so

libMyClass.so: Outer.cc Inner.cc MyClassDict.cxx
        $(CXX) -shared -o $@ $(CXXFLAGS) $(LDFLAGS) $^

MyClassDict.cxx: Outer.h Inner.h Linkdef.h
        rootcling -f $@ -rmf MyClassDict.rootmap -rml libMyClass.so $^

.PHONY: clean
clean:
        rm -rf MyClassDict* libMyClass.so
```

```C++
/* Outer.h */
#include "TString.h"
#include <iostream>

class Outer
{
  public:
    Outer();
  private:
    TString _outer;
};

```

```C++
/* Outer.cc */
#include "Outer.h"

using std::cout;
using std::endl;

Outer::Outer (): _outer("outer")
{
  cout << _outer << endl;
}
```

```c++
#include "TString.h"
#include <iostream>
/* Inner.h */
class Inner
{
 public:
  Inner();
 private:
  TString _inner;
};
```

```c++
/* Inner.cc */
#include "Inner.h"

using std::cout;
using std::endl;

Inner::Inner (): _inner("inner")
{
  cout << _inner << endl;
}
```


<a id="orge0001cd"></a>

# Built-in functions


<a id="orgc8251be"></a>

## Efficiency plots     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-11 Thu 16:47]</span></span>

`TH1::Divide` can give errors accounting for binomial distributions if you supply `"B"` option. However, it won't give error if `#pass = #total`. It is recommended to use `TGraphAsymmErrors::Divide` instead.


<a id="orgcdbcb1d"></a>

## User-defined functions in cling/rootcling     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-28 Sun 16:05]</span></span>

Functions cannot be auto-loaded without c++ modules. However, [one](https://root-forum.cern.ch/t/using-user-defined-function-in-cling/36049) mentioned that the putting the function inside a namespace or a class. I cannot manage to do it via a namespace but a class.


<a id="orga89ff87"></a>

## How to generate string using `Form` and `Format`

Please check this [link](https://root-forum.cern.ch/t/question-on-tstring-form/27587/3). I copied the response from Philippe below and reinterpret a bit. In summary, it is recommended to use `TString::Form` and `TString::Format`, rather than the two globally defined functions, `::Form` and `::Format`.

-   `TString::Form` modifies an existing `TString`
-   `TString::Format` is a static function and it create a new `TString`.
-   `::Form` and `::Format`, using these two, you need to make sure that the result is not being passed to a function that itself will call one of these two functions as it would ‘overwrite’ the buffer while it is being used. These two functions date back to a time when creating temporary object and especially copying them (i.e. no move semantic) was very expansive.

A solution to generate `C++` string can be found in the [link](https://stackoverflow.com/questions/2342162/stdstring-formatting-like-sprintf).


<a id="orgc0397e1"></a>

## How to add include path and load the libraries

See the [discussions](https://root-forum.cern.ch/t/problem-loading-customized-style-while-launching-root/18664/11). The inclue path need to be added and the library needs to be added before the macro is loaded/executed. One way to do is to create a `rootlogon.C` file:

```c++
gInterpreter->AddIncludePath("path/to/dir");
gSystem->Load("libMyClass.so");
```

You could do it via the MACRO `R__ADD_INCLUDE_PATH`, and `R__LOAD_LIBrARY`, if you do not want to create a `rootlogon.C` file. See the doc for [Rtypes](https://root.cern/doc/master/Rtypes_8h.html). These macros cannot be recognized by `ACLiC`, so you have to hide them using `__CLING__`, (I do not know if I need `__ROOTCLING__`).

```c++
// note, there is no "".
#if defined(__CLING__)
R__ADD_INCLUDE_PATH(/path/to/dir)
R__LOAD_LIBRARY(path/to/lib)
#endif
#include "MyInclude.hpp"
```

There was another method in the user-guide. It looks like:

```c++
// check to see if the event class is in the dictionary
// if it is not load the definition in libEvent.so
if (!TClassTable::GetDict("Event")) {
  gSystem->Load("$ROOTSYS/test/libEvent");
}
```

You can find it the chapter `TTree` and in old ROOT source code, for example, the [6-08-00 patch](https://github.com/root-project/root/blob/v6-08-00-patches/tutorials/tree/tree4.C). It does not work anymore. Now it is replaced with `R__LOAD_LIBRARY` if you trace the changes under different tags. ROOT team may need to update the user-guide in the future. See the [GitHub Link](https://github.com/root-project/root/blob/master/tutorials/tree/tree4.C).


<a id="orgeca18f1"></a>

## Colors in `ROOT`

All descriptions are based one the [link](https://root.cern.ch/doc/master/classTColor.html). Colors can be characterized via RGB or HLS. HLS means, hue, light and saturation. I know nothing about HLS so I do not want to use it. There are several functions to manipulate HLS and make conversions between HLS and RGB back and forth.


<a id="org9e5d889"></a>

### How to create a new color

Colors are characterized by RGB attributes. You have two ways to define a new color:

-   Modifying an existing color
    
        TColor *color = gROOT->GetColor(10);
        color->SetRGB(0.1, 0.2, 0.3);
-   Create from a free color.
    
        Int_t ci = TColor::GetFreeColorIndex();
        TColor *color = new TColor(ci, 0.1, 0.2, 0.3);


<a id="org96200d4"></a>

### Classifications

I only discuss predefined colors.

-   Basic colors, available through `TCanvas::DrawColorTable()`.
-   Color wheel, can be created via `TColorWheel` and it can be attached to a canvas via `SetCanvas`.
-   Bright and drak colors. They are for pave and boxes. You could create them via `TColor::GetColorDark` and `TColor::GetColorBright`.


<a id="org0f56988"></a>

### Views and options

Several things can be modified to get a new view besides changing the color.

-   Grayscale views.
-   Color palette
-   Transparency

1.  Grayscale

    This is done via canvas. You could do it via `TCanvas::SetGrayscale()`.

2.  Color palette

    1.  Customization
    
        This is useful for display in case of higher dimensions. You could define new palette in two ways:
        
        -   Make use of `gSytle->SetPalette`. This function take two arguments, the number of colors in the palette and the array which contains the indices of colors in the palette.
        -   A very complex palette can be created via `TColor::CreateGradientColorTable`. It has the following parameters in order (I copy from the official reference documentations):
            
            -   Number: The number of end point colors that will form the gradients. Must be at least 2.
            -   Stops: Where in the whole table the end point colors should lie. Each entry must be on [0, 1], each entry must be greater than the previous entry.
            -   Red: The end point color values. Each entry must be on [0, 1]
            -   Green: The end point color values. Each entry must be on [0, 1]
            -   Blue: The end point color values. Each entry must be on [0, 1]
            -   NColors: Total number of colors in the table. Must be at least 1.
            -   alpha: the opacity factor, between 0 and 1. Default is no transparency (1).
            -   setPalette: activate the newly created palette (true by default). Otherwise you need to use the return value and reconstruct the palette array and then call `TColor::SetPalette`. Do this:
                
                ```c++
                Int_t MyPalette[100];
                Double_t Red[]    = {0., 0.0, 1.0, 1.0, 1.0};
                Double_t Green[]  = {0., 0.0, 0.0, 1.0, 1.0};
                Double_t Blue[]   = {0., 1.0, 0.0, 0.0, 1.0};
                Double_t Length[] = {0., .25, .50, .75, 1.0};
                Int_t FI = TColor::CreateGradientColorTable(5, Length, Red, Green, Blue, 100);
                for (int i=0;i<100;i++) MyPalette[i] = FI+i;
                ```
            
            Return value is a positve value (the index of the first color of the palette) on success and -1 on error. This method is quite complicate. I do not suggest to use or you can copy someone's setup. I copied from [Andre Stahl](https://orcid.org/0000-0002-5397-252X).
            
            ```c++
            void setPalette()
            {
              gStyle->SetPalette(55);
              const Int_t NRGBs = 5;
              const Int_t NCont = 255;
              // const Int_t NCont = 16;
              Double_t stops[NRGBs] = { 0.00, 0.34, 0.61, 0.84, 1.00 };
              Double_t red[NRGBs]   = { 0.00, 0.00, 0.87, 1.00, 0.51 };
              Double_t green[NRGBs] = { 0.00, 0.81, 1.00, 0.20, 0.00 };
              Double_t blue[NRGBs]  = { 0.51, 1.00, 0.12, 0.00, 0.00 };
              TColor::CreateGradientColorTable(NRGBs, stops, red, green, blue, NCont);
              gStyle->SetNumberContours(NCont);
            }
            ```
        
        If you want to activate two palettes at the same time, try to read the tutorial codes `multipalette`, via the [link](https://root.cern.ch/doc/master/multipalette_8C.html).
    
    2.  Predefined palettes
    
        I like predefined palettes. You could reset the palette via `gStyle->SetPalette(num)`. These predefined color palettes are classified into two categories according to one criteria: if it is Color Vision Deficiency friendly. I take two examples heres:
        
        -   **Friendly:** `kBird` (This is defualt one).
        -   **Non friendly:** `kRainBow`

3.  Transparency

    The transparency of colors is set through alpha component. The value is from 0 (fully transparent) to 1 (fully opaque). There are also several ways to do:
    
    -   Modify an existing one
        
        ```c++
        TColor *col26 = gROOT->GetColor(26);
        col26->SetAlpha(0.01);
        ```
    -   Create a new one
        
        ```c++
        Int_t ci = 1756;
        TColor *color = new TColor(ci, 0.1, 0.2, 0.3, "", 0.5); // alpha = 0.5
        ```
        
        or
        
        ```c++
        Int_t trans_red = GetColorTransparent(kRed, 0.3);
        ```
