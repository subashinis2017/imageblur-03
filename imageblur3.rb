class Image
    def initialize(imgarray, blnarray)
        @imgarray = imgarray
        @blnarray = blnarray
    end

    def blur(manhattandist)
        # Loop over indexes.
        @imgarray.each_index do |i|

            # Get subarray and loop over its indexes also.
            rowarray = @imgarray[i]
            rowarray.each_index do |j|
                if !pixel_changed?(i,j) && (@imgarray[i][j] == 1)
                    start_i = i-manhattandist
                    end_i = i+manhattandist
                    for i_index in (start_i..end_i)
                        if in_bounds?(i_index, j)
                            @imgarray[i_index][j] = 1
                            @blnarray[i_index][j] = true
                        end
                    end
                    start_j = j-manhattandist
                    end_j = j+manhattandist
                    for j_index in (start_j..end_j)
                        if in_bounds?(i, j_index)
                            @imgarray[i][j_index] = 1
                            @blnarray[i][j_index] = true
                        end
                    end
                end
            end
        end
    end

    def in_bounds?(row, col)
        row_range = 0...@imgarray.length
        return false if !(row_range.cover?(row))

        col_range = 0...@imgarray[row].length
        row_range.cover?(row) && (col_range.cover?(col))
    end

    def pixel_changed?(row, col)
        @blnarray[row][col]
    end

    def output_image
        @imgarray.each do |row|
            puts row.join
        end
    end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
],
[  
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false]
])


image.blur(3)

image.output_image