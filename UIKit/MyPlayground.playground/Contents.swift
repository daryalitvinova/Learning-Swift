import Foundation

func printThreadInfo(_ label: String) {
    let thread = Thread.current
    let name = thread.name ?? "unnamed"
    print("[\(label)] Thread: \(thread), name: \(name), isMain: \(thread.isMainThread)")
}

//@MainActor
func asyncThreadDemo() async {
    printThreadInfo("Start") // не главный поток, asyncThreadDemo() не имеет @MainActor, и Swift-исполнитель (executor) решает, что его можно выполнить на любом фоне

    // Несколько искусственных асинхронных шагов
    for i in 1...5 {
        await Task.sleep(500_000_000) // 0.5 секунды
        await withUnsafeContinuation { cont in
            DispatchQueue.global().async {
                printThreadInfo("Step \(i)")
                cont.resume()
            }
        }
    }

    printThreadInfo("End")
}

printThreadInfo("Before async") //главный поток
await asyncThreadDemo()
printThreadInfo("After async") //главный поток
