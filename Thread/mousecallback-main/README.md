# Callback demo

The demo is a C++ driver for the mouse pointer with
a callback interface:

```
struct Mousecallback {
public:
	virtual void hasData(int x, int y, bool left, bool middle, bool right) = 0;
};
```

## How to compile

Do

```
cmake .
make
```

## How to run

```
sudo ./CMouse
```

The program ends after 5 secs automatically.


