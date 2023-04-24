//
//  FoodPickerTests.swift
//  FoodPickerTests
//
//  Created by Changjun Li on 2023/3/5.
//

import XCTest
@testable import FoodPicker

final class SuffixTests: XCTestCase {

    var sut: Suffix<MyWeightUnit>!
    // 命名的convention:
    // test_主体_情况_结果
    // Arrange Act Assert
    func testJoinNumberAndSuffix() throws {
        // test_formattedString_suffixIsempty_shouldNotIncludeSpace
        // Arrange 设定
        //sut = .init(wrappedValue: 100, "")

        // Act 变化
        //let result = sut.projectedValue

        // Assert 结果
        //XCTAssertEqual(result, "100", "检查格式!")

        sut = .init(wrappedValue: 15.67, .gram)
        XCTAssertEqual(sut.projectedValue.description, "15.7 g", "检查格式!")
    }

    func testNumberFormatter() {
        sut = .init(wrappedValue: 100, .gram)
        XCTAssertEqual(sut.projectedValue.description, "100 g", "检查格式!")

        sut = .init(wrappedValue: -100.678, .gram)
        XCTAssertEqual(sut.projectedValue.description, "-100.7 g")
    }
}
