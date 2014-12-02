(class MyClass is ViewController
    (- (void) foo is
        (super foo)
        (puts "this is MyClass::foo")
    )
)