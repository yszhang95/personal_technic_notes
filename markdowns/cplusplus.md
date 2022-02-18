- [Tips for `C++`](#orgc587b6f)
  - [How to trim `std::stirng`](#orga93659d)
  - [Better way to create an array with the variable size](#orgc70d2da)
  - [It is preferred to use `make_unique`](#org5fd52b0)
  - [Do not abuse `std::endl`](#org3a02f9b)
  - [Replace a character in `std::stirng`](#org401c2c6)
  - [Format the `std::string`](#org08286e9)
  - [Parameter pack and variadic template](#orga6df0c9)
  - [Which part of the constructor should be in header/source code](#orgf7b2b25)
  - [Infinity](#org9448d0a)
  - [Convert characters in a string](#orgf58cd55)
  - [std::transform](#org7d703a0)
  - [`try-catch` block](#org960962f)



<a id="orgc587b6f"></a>

# Tips for `C++`


<a id="orga93659d"></a>

## How to trim `std::stirng`

trim functions are copied from [stackoverflow](https://stackoverflow.com/questions/216823/whats-the-best-way-to-trim-stdstring).

```c++
#include <algorithm>
#include <cctype>
#include <locale>
// trim from start (in place)
static inline void ltrim(std::string &s) {
  s.erase(s.begin(), std::find_if(s.begin(), s.end(), [](unsigned char ch) {
    return !std::isspace(ch);
  }));
}

// trim from end (in place)
static inline void rtrim(std::string &s) {
  s.erase(std::find_if(s.rbegin(), s.rend(), [](unsigned char ch) {
    return !std::isspace(ch);
  }).base(), s.end());
}

// trim from both ends (in place)
static inline void trim(std::string &s) {
  ltrim(s);
  rtrim(s);
}

// trim from start (copying)
static inline std::string ltrim_copy(std::string s) {
  ltrim(s);
  return s;
}

// trim from end (copying)
static inline std::string rtrim_copy(std::string s) {
  rtrim(s);
  return s;
}

// trim from both ends (copying)
static inline std::string trim_copy(std::string s) {
  trim(s);
  return s;
}
```


<a id="orgc70d2da"></a>

## Better way to create an array with the variable size

I refer to this [answer](https://stackoverflow.com/a/21377382) and this [link](https://en.cppreference.com/w/cpp/memory/unique_ptr/make_unique). An example is

    std::unique_ptr<unsigned char[]> testData(new unsigned char[16000]());
    auto testData = std::make_unique<unsigned char[]>(16000);

Note that `make_unique` is available from `C++14`.


<a id="org5fd52b0"></a>

## It is preferred to use `make_unique`

`make_unique` is exception safe:

    foo(make_unique<T>(), make_unique<U>()); // exception safe
    foo(unique_ptr<T>(new T()), unique_ptr<U>(new U())); // unsafe*

In the second line, the unspecified-evaluation-order may trigger memory leak. I refer to [this answer](https://stackoverflow.com/a/37514601), [this answer](https://stackoverflow.com/a/22571331), and the [blog](https://isocpp.org/blog/2019/06/quick-q-differences-between-stdmake-unique-and-stdunique-ptr-with-new). They own the credits.


<a id="org3a02f9b"></a>

## Do not abuse `std::endl`

Use '\n' if you really want a new line. Please consult this [post](https://kuhllib.com/2012/01/14/stop-excessive-use-of-stdendl/).


<a id="org401c2c6"></a>

## Replace a character in `std::stirng`

I checked this [answer](https://stackoverflow.com/a/2896627). It only works if you want replace a character with a character.

An example to replace a character with a desired one:

```c++
std::string s = "example string";
std::replace( s.begin(), s.end(), 'x', 'y'); // replace all 'x' to 'y'
```

You may want to replace a sub-string with another sub-string like:

```c++
std::string s = "pT1.0to2.0_yAbsMax2.4";
for (auto pos = s.find(".0"); pos!=std::string::npos;
     pos = s.find(".0", pos)) { // find ".0" from pos (pos is position index)
  s.replace(pos, 2, ""); // replace following 2 character starting from pos
 }
```


<a id="org08286e9"></a>

## Format the `std::string`

In principle, you could make use of `std::sprintf` and `std::snprintf` before `C++20`. The `snprintf` starts from `C++11`. You would like to refer to [the reference](https://en.cppreference.com/w/cpp/io/c/fprintf).

It is also helpful to warp them up. I copied the code from the [answer](https://stackoverflow.com/a/26221725). It looks like:

```c++
#include <memory>
#include <string>
#include <stdexcept>

template<typename ... Args>
std::string string_format( const std::string& format, Args ... args )
{
    int size_s = std::snprintf( nullptr, 0, format.c_str(), args ... ) + 1; // Extra space for '\0'
    if( size_s <= 0 ){ throw std::runtime_error( "Error during formatting." ); }
    auto size = static_cast<size_t>( size_s );
    auto buf = std::make_unique<char[]>( size );
    std::snprintf( buf.get(), size, format.c_str(), args ... );
    return std::string( buf.get(), buf.get() + size - 1 ); // We don't want the '\0' inside
}
```

It make use of the variadic template in the declaration (see [Parameter pack and variadic template](#orga6df0c9)). And it make use of a variable size of array instead of fixed size arrays. This is because `snprintf` have the following properties:

> If the resulting string gets truncated due to buf<sub>size</sub> limit, function returns the total number of characters (not including the terminating null-byte) which would have been written, if the limit was not imposed.

A `C++20` solution is [`std::format`](https://en.cppreference.com/w/cpp/utility/format/format).


<a id="orga6df0c9"></a>

## Parameter pack and variadic template

You could refer to the [answer](https://stackoverflow.com/a/19923558) and the [link](https://en.cppreference.com/w/cpp/language/parameter_pack). I do not understand the details very much. An example is in [Format the `std::string`](#org08286e9).


<a id="orgf7b2b25"></a>

## Which part of the constructor should be in header/source code

I quote the words from the [reference](https://en.cppreference.com/w/cpp/language/constructor).

> The body of a function definition of any constructor, before the opening brace of the compound statement, may include the *member initializer list*, whose syntax is the colon character `:`, followed by the *comma-separated list* of one or more *member-initializers*.

I also thank this short [answer](https://stackoverflow.com/a/15335287/12357991). Thus the member initializer list need to be included in *source code* since it is part of the function definition.

The default value of arguments should be put in header. I guess the the default arguments (optional arguments?) are parts of function declaration. I did not dived into the [reference](https://en.cppreference.com/w/cpp/language/function), the [question](https://stackoverflow.com/questions/9260246/should-c-function-default-argument-values-be-specified-in-headers-or-cpp-sour), and the [question](https://stackoverflow.com/questions/14902129/default-parameters-in-h-and-cpp-files).


<a id="org9448d0a"></a>

## Infinity

Float number can be assigned as infinity. Please refer to the [reference](https://en.cppreference.com/w/cpp/types/numeric_limits/infinity). Note that not each type has inifinity.

I made test under root-v6.24.06 shipped with Fedora-35.

In root prompt, I tried

    root [] std::numeric_limits<double>::infinity() > 3E1000
    ROOT_prompt_3:1:43: warning: magnitude of floating-point constant too large for type 'double'; maximum is 1.7976931348623157E+308 [-Wliteral-range] std::numeric_limits<double>::infinity() > 3E1000
    (bool) false
    root [] std::numeric_limits<double>::infinity()
    (double) inf
    root [] std::numeric_limits<float>::infinity()
    (double) inff
    root [] std::numeric_limits<long double>::infinity()
    (double) infL
    root [] std::numeric_limits<int>::infinity()
    (double) 0

BTW, you could also try `std::stof` and etc.. In root prompt

    root [] stof("inf")
    (float) inff

But you cannot do similar for `std::stoi` and etc..

Please check the [reference](https://en.cppreference.com/w/cpp/string/basic_string/stol) and the [reference](https://en.cppreference.com/w/cpp/string/basic_string/stof).

Positive infinity is always larger than all values except itself and `NaN`. I copied the [answer](https://stackoverflow.com/a/52817548) here: According to [gnu-libc](https://www.gnu.org/software/libc/manual/html_node/Infinity-and-NaN.html):

> In comparison operations, positive infinity is larger than all values except itself and NaN

To check the infinity, use `std::isinf`. Check this [link](https://en.cppreference.com/w/cpp/numeric/math/isinf). It mentions an example, `exp(800)` is considered as `true`.


<a id="orgf58cd55"></a>

## Convert characters in a string

Please check the library `cctype`. The link is [here](https://en.cppreference.com/w/cpp/header/cctype).

I take the function `std::tolower` as an example.

You would like to use `std::transform`. I copy this example from the [link](https://en.cppreference.com/w/cpp/string/byte/tolower).

```c++
std::string str_tolower(std::string s) {
  std::transform(s.begin(), s.end(), s.begin(),
                 // static_cast<int(*)(int)>(std::tolower)         // wrong
                 // [](int c){ return std::tolower(c); }           // wrong
                 // [](char c){ return std::tolower(c); }          // wrong
                 [](unsigned char c){ return std::tolower(c); } // correct
                 );
  return s;
}
```

You need to always convert the type of characters to `unsigned char` at first, otherwise the behavior is undefined, as described in the `Notes` in the [link](https://en.cppreference.com/w/cpp/string/byte/tolower). I quote the descriptions here:

> Like all other functions from `<cctype>`, the behavior of `std::tolower` is *undefined* if the argument's value is neither representable as `unsigned char` nor equal to `EOF`. To use these functions safely with plain `char` (or `signed char`), the argument should first be converted to `unsigned char`. Similarly, they should *not* be directly used with standard algorithms when the iterator's value type is `char` or `signed char`. Instead, convert the value to `unsigned char` first.


<a id="org7d703a0"></a>

## std::transform

This function have several versions. Please check the [reference](https://en.cppreference.com/w/cpp/algorithm/transform).

I think there are two main categories:

-   unary operations
-   binary operations

I think I only use two versions.

-   The arguments in order are first, last iterator of input range, first iterator of the destination , unary operation.
-   The arguments in order are first, last iteartor of input range, first iterator of the second input range, first of the output iterator, binary operation.

However, I do not know what will happen if the second input range or the destination have smaller capacities than the first input range. Is it *undefined*?


<a id="org960962f"></a>

## `try-catch` block

Please check the details in the [reference](https://en.cppreference.com/w/cpp/language/try_catch).

You could put as many as `catch` after `try`. There are three main categories for `catch` arguments:

-   named parameter, `const std::exception& e`.
-   unmaed parameter, `const std::exception&)`.
-   catch all handler, `(...)`.

The named/unmaed arguments can be base classes or derived classes. Besides, the `std::exception` and its derived classes, you could also use simple types, an example from the [reference](https://en.cppreference.com/w/cpp/language/try_catch):

```c++
try
{
    std::cout << "Throwing an integer exception...\n";
    throw 42;
}
catch (int i)
{
    std::cout << " the integer exception was caught, with value: " << i << '\n';
}
```

There are a lot of details to be careful about. I mention a couple of things here.

-   If you put an abstract exception before a derived one, you may not be able to catch the derived one anymore. The exception is captured by the first catch.
-   If you do not put `catch (...)`, you may miss this exception in current `try-catch` block. How the exception will be handled are documented in the doc for [throw](https://en.cppreference.com/w/cpp/language/throw).
