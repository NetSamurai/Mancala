<?php
    function convertQueryToBoard( $result ) {
        // a 'board' is a 2d layout of column with its associative paired holes
        // regardless of visual orientation, the id mapping retains relative meaning
        // there are always n / 2 columns in a zero-based mancala board
        $max_columns = mysqli_num_rows( $result ) / 2;
        $board = [];
        
        while( $row = mysqli_fetch_array( $result ) )
        {
            $name = trim( $row["name"] );
            $name_number = intval( substr( $name, -1) );

            // append relation mapping to query result block
            for ( $col = 0; $col <= $max_columns; $col++ ) {
                // alias for later
                $hole = $col;
                if( $name_number === $col ) {
                    // set player 2 pot
                    $p = intval( trim( substr( $name, 1, 1 ) ) );
                    if( $col === 0 && $p === 2 ) {
                        $col = $max_columns;
                    }
                    
                    // push or create and push into array
                    if( isset( $board[$col] ) ){
                        array_push( $board[$col], $name );
                    } else {
                        $board[$col] = [];
                        array_push( $board[$col], $name );
                    }
                }
            } 
        }
        return $board;
    }

    function displayBoard( $board ) {
        for ( $col = 0; $col <= count($board)-1; $col++ ) {
            $mancala_column = $board[$col];
            
            echo '<div id="hole_'. $col . '" class="game-holes">';
            foreach( $mancala_column as $mancala_hole ) {
                echo '<div id="'. $mancala_hole . '_div"';
                if( $col !== 0 ) {
                    echo 'class="game-piece"';
                }
                echo '></div>';
            }
            echo '</div>';
        }
    }
?>