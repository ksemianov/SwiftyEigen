extension EIGMatrix {
    public subscript(row: Int, col: Int) -> Float {
        get { return value(row: row, col: col) }
        set { setValue(newValue, row: row, col: col) }
    }
}
