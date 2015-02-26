(class MyClass is ViewController
    (- (void) foo is
        (super foo)
        (puts "this is MyClass::foo")
    )

    (- (void) bar:(int)a b:(int)b is
    	(puts "this is bar #{a}, #{b}")
    )
)