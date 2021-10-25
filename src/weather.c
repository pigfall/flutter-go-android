/* Copyright (c) 2021 Razeware LLC
**
** Permission is hereby granted, free of charge, to any person
** obtaining a copy of this software and associated documentation
** files (the "Software"), to deal in the Software without
** restriction, including without limitation the rights to use,
** copy, modify, merge, publish, distribute, sublicense, and/or
** sell copies of the Software, and to permit persons to whom
** the Software is furnished to do so, subject to the following
** conditions:
**
** The above copyright notice and this permission notice shall be
** included in all copies or substantial portions of the Software.
**
** Notwithstanding the foregoing, you may not use, copy, modify,
** merge, publish, distribute, sublicense, create a derivative work,
** and/or sell copies of the Software in any work that is designed,
** intended, or marketed for pedagogical or instructional purposes
** related to programming, coding, application development, or
** information technology. Permission for such use, copying,
** modification, merger, publication, distribution, sublicensing,
** creation of derivative works, or sale is expressly withheld.
**
** This project and source code may use libraries or frameworks
** that are released under various Open-Source licenses. Use of
** those libraries and frameworks are governed by their own
** individual licenses.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
** NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
** HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
** WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
** DEALINGS IN THE SOFTWARE.
*/

#include <string.h>
#include <stddef.h>
#include <stdbool.h> 
#include <stdlib.h>

double get_temperature()
{
	return 86.0f;
}

char *get_forecast()
{
	char *forecast =  "sunny";
	char *forecast_m = malloc(strlen(forecast));
	strcpy(forecast_m, forecast);
	return forecast_m;
}

struct ThreeDayForecast  {
	double today;
	double tomorrow;
	double day_after;
};

double fahrenheit_to_celsius(double temperature) {
	return (5.0f / 9.0f) * (temperature - 32);
}

struct ThreeDayForecast get_three_day_forecast(bool useCelsius) {
	struct ThreeDayForecast forecast;
	forecast.today = 87.0f;
	forecast.tomorrow = 88.0f;
	forecast.day_after = 89.0f;
	
	if(useCelsius) {
		forecast.today = fahrenheit_to_celsius(forecast.today);
		forecast.tomorrow = fahrenheit_to_celsius(forecast.tomorrow);
		forecast.day_after = fahrenheit_to_celsius(forecast.day_after);
	}
	return forecast;
}
