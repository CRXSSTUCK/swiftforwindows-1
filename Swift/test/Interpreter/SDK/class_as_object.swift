// RUN: rm -rf %t  &&  mkdir %t
// RUN: %target-build-swift %s -o %t/a.out
// RUN: %target-run %t/a.out | FileCheck %s
// REQUIRES: executable_test

// REQUIRES: objc_interop

import Foundation

let classes = NSMutableArray()
classes.add(NSObject.self)
classes.add(NSString.self)
classes.add(NSNumber.self)

for obj: AnyObject in classes {
  print(obj.description)
}
// CHECK: NSObject
// CHECK-NEXT: NSString
// CHECK-NEXT: NSNumber

print(NSObject.conforms(to: NSCopying.self))
// CHECK-NEXT: false
print(NSString.conforms(to: NSCopying.self))
// CHECK-NEXT: true
