enum Resource<T> {
    case loading
    case success(T)
    case failure(Error)
}
