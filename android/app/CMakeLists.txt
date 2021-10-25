cmake_minimum_required(VERSION 3.4.1)  

add_library( 
            weather
            SHARED
            ../../src/weather.c
)

add_library( 
					 	 tzzlib
             SHARED
             IMPORTED 
) 

set_target_properties( # Specifies the target library.
                       tzzlib
                       PROPERTIES IMPORTED_LOCATION
											 libs/${ANDROID_ABI}/tzzlib.so
                       )





include_directories( tzzlib.h )
