
ENTRY(Reset_Handler)


MEMORY
{
    CCMRAM(xrw)     : ORIGIN = 0x10000000, LENGTH = 64K
    FLASH(rx)       : ORIGIN = 0x08000000, LENGTH = 1024K
    RAM (rwx)       : ORIGIN = 0x20000000, LENGTH = 128K 
}

SECTIONS
{
    .text :
    {
        KEEP(*(.isr_vector))
        *(.text)
        *(.text.*)
        *(.rodata)
        _sidata = .;
    } >FLASH

    .data : AT(_sidata)
    {
        _sdata = .;
        *(.data)
        *(.data.*)
        _edata = .;
    } >RAM

    .bss :
    {
        _sbss = .;
        *(.bss)
        *(.bss.*)
        _ebss = .;
    } >RAM

    _estack = ORIGIN(RAM) + LENGTH(RAM);
}


