// RUN: %target-swift-ide-test -code-completion -source-filename %s -F %S/Inputs/mock-sdk -code-completion-token=CLANG_IMPORT1 | FileCheck %s -check-prefix=CLANG_IMPORT1
// RUN: %target-swift-ide-test -code-completion -source-filename %s -F %S/Inputs/mock-sdk -code-completion-token=CLANG_IMPORT2 | FileCheck %s -check-prefix=CLANG_IMPORT2
// RUN: %target-swift-ide-test -code-completion -source-filename %s -F %S/Inputs/mock-sdk -code-completion-token=CLANG_IMPORT3 | FileCheck %s -check-prefix=CLANG_IMPORT3
// RUN: %target-swift-ide-test -code-completion -source-filename %s -F %S/Inputs/mock-sdk -code-completion-token=CLANG_IMPORT4 | FileCheck %s -check-prefix=CLANG_IMPORT4
// RUN: %target-swift-ide-test -code-completion -source-filename %s -F %S/Inputs/mock-sdk -code-completion-token=CLANG_IMPORT5 | FileCheck %s -check-prefix=CLANG_IMPORT5
// RUN: %target-swift-ide-test -code-completion -source-filename %s -F %S/Inputs/mock-sdk -code-completion-token=CLANG_IMPORT6 | FileCheck %s -check-prefix=CLANG_IMPORT6
// RUN: %target-swift-ide-test -code-completion -source-filename %s -F %S/Inputs/mock-sdk -code-completion-token=CLANG_IMPORT7 | FileCheck %s -check-prefix=CLANG_IMPORT7
// RUN: %target-swift-ide-test -code-completion -source-filename %s -F %S/Inputs/mock-sdk -code-completion-token=CLANG_IMPORT8 | FileCheck %s -check-prefix=CLANG_IMPORT8

// REQUIRES: objc_interop

import #^CLANG_IMPORT1^#

// CLANG_IMPORT1:	Begin completions
// CLANG_IMPORT1-DAG:	Decl[Module]/OtherModule[Foo]:                       Foo[#Module#]; name=Foo
// CLANG_IMPORT1-DAG:	Decl[Module]/OtherModule[FooHelper]:                 FooHelper[#Module#]; name=FooHelper
// CLANG_IMPORT1-DAG:	Decl[Module]/OtherModule[Bar]:                       Bar[#Module#]; name=Bar
// CLANG_IMPORT1-NOT:	SwiftShims

import Foo

import #^CLANG_IMPORT2^#

// CLANG_IMPORT2: Begin completions
// CLANG_IMPORT2-DAG: Decl[Module]/OtherModule[Foo]/NotRecommended: Foo[#Module#]; name=Foo
// CLANG_IMPORT2-DAG: Decl[Module]/OtherModule[FooHelper]/NotRecommended: FooHelper[#Module#]; name=FooHelper
// CLANG_IMPORT2-DAG:	Decl[Module]/OtherModule[Bar]:                       Bar[#Module#]; name=Bar
// CLANG_IMPORT2-NOT:	SwiftShims

import Foo.#^CLANG_IMPORT3^#

// CLANG_IMPORT3: Begin completions
// CLANG_IMPORT3-NEXT: Decl[Module]/OtherModule[FooSub]:   FooSub[#Module#]; name=FooSub

import Foo.FooSub

import Foo.#^CLANG_IMPORT8^#

// FIXME: This should be marked as not recommended, holding for Swift's submodules support.
// CLANG_IMPORT8: Begin completions
// CLANG_IMPORT8-NEXT: Decl[Module]/OtherModule[FooSub]:   FooSub[#Module#]; name=FooSub

import Foo#^CLANG_IMPORT4^#
// CLANG_IMPORT4-NOT: Begin completions

import Foo #^CLANG_IMPORT5^#
// CLANG_IMPORT5: Begin completions

import Foo.FooSub#^CLANG_IMPORT6^#
// CLANG_IMPORT6-NOT: Begin completions

import Foo.FooSub #^CLANG_IMPORT7^#
// CLANG_IMPORT7: Begin completions
