#! /usr/bin/newlisp

(load "lib/test/asserts.lsp")
(load "lib/base.lsp")

(set 'except '("marginal_graphic_dropcap.lsp" "text_replacement.lsp" "left_marginal.lsp")) ; which files don't include to the test
;(set 'except '())
;(set 'include '("absolute.lsp")) ;..or directly what files to test 
(set 'SF nil) ; successful flag: if true - print results of successful tests, nil - omit them
(set '@test_total 0 '@test_ok 0 '@test_failed 0 '@test_files 0) ; global counters

(set 'lib_files (filter (fn(x) (find "\.lsp$" x 1)) (directory "tests")))
(set 'lib_files (difference lib_files except))

(when (> (length include) 0) (set 'lib_files include))

(dolist (l lib_files)
    (println "*** Testing " l)
    (eval-string (read-file (string "tests/" l)))
    (inc @test_files))

(println "==============")
(println "TEST REPORT: ")
(println "total number of test files: " @test_files)
(println "tests OK: " @test_ok)
(println "tests " ((cond-upper-case @test_failed) "failed: ") @test_failed) 
(println "total number of assertions: " @test_total)

(exit)
    
