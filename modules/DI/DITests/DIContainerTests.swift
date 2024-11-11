import XCTest
@testable import DI

final class DIContainerTests: XCTestCase {
    
    var sut: DIContainer!

    override func setUp() {
        super.setUp()
        sut = DIContainer.shared
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testResolve_whenDependencyIsRegistered_thenShouldResolveToSameDependency() {
        // given
        let dependency = "test"
        sut.register(type: String.self) { _ in dependency }

        // when
        let resolved = sut.resolve(type: String.self)

        // then
        XCTAssertEqual(resolved, dependency)
    }
    
    func testResolve_whenSameTypeDependencyIsRegisteredWithoutName_thenShouldResolveToLastDependency() {
        // given
        let dependency1 = "test1"
        let dependency2 = "test2"
        sut.register(type: String.self) { _ in dependency1 }
        sut.register(type: String.self) { _ in dependency2 }

        // when
        let resolved = sut.resolve(type: String.self)

        // then
        XCTAssertEqual(resolved, dependency2)
    }
    
    func testResolve_whenSameTypeDependencyIsRegisteredWithName_thenShouldResolveToSameDependencies() {
        // given
        let dependency1 = "test1"
        let dependency2 = "test2"
        sut.register(type: String.self, name: "dep1") { _ in dependency1 }
        sut.register(type: String.self, name: "dep2") { _ in dependency2 }

        // when
        let resolved1 = sut.resolve(type: String.self, name: "dep1")
        let resolved2 = sut.resolve(type: String.self, name: "dep2")

        // then
        XCTAssertEqual(resolved1, dependency1)
        XCTAssertEqual(resolved2, dependency2)
    }
    
    func testResolve_whenDependencyIsNotRegistered_thenShouldNotResolve() {
        // when
        let resolved = sut.resolve(type: String.self)

        // then
        XCTAssertNil(resolved)
    }

}
