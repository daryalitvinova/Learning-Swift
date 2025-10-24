import Foundation

func testGSD () {
    print ("1")

    DispatchQueue.main.async {
        print ("2")
    }

   DispatchQueue.main.sync {
        print ("3")
        print ("4")
    }

    /*DispatchQueue.global().sync {
        print ("5")
        DispatchQueue.main.async {
            print ("6" )
            print ("7")
        }
    }*/
}

testGSD()
