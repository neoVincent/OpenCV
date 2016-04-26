isEmpty(PACKAGE_DESTIR) {
    PACKAGE_DESTIR = $$PWD/../build
}

CONFIG(debug, debug|release) {
    PACKAGE_DESTIR = $$PACKAGE_DESTIR/debug
} else {
    PACKAGE_DESTIR = $$PACKAGE_DESTIR/release
}


OPENCV_DIR = $$(OPENCV_HOME)

win32 {
    QMAKE_LIBDIR += $$OPENCV_DIR/build/x64/vc12/lib
    INCLUDEPATH += $$OPENCV_DIR/build/include/
}

mac{
#    QMAKE_LIBDIR +=
}

export(QMAKE_LIBDIR)


defineTest(copyLibrary) {
    #retrieve package
    folder = $$1
    library = $$2
    destination = $$3

    # Copy bins to output
    # folder = $$PWD/x64/vc12/bin/
    # library = opencv_world310d

    win32 { library = $${library}.dll }
    else:unix { library = library$${library}.so }
    else {library = library$${library}.$${QMAKE_EXTENSION_SHLIB}}

    path = $$folder/$$library

    QMAKE_POST_LINK += $(COPY_FILE) \
                    $$system_quote($$shell_path($$path)) \
                    $$system_quote($$shell_path($$destination)) $$escape_expand(\\n\\t)
    export(QMAKE_POST_LINK)
}
