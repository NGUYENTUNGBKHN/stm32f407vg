
ENTRY(Reset_Handler)

_Min_Heap_Size = 0x200; /* required amount of heap */
_Min_Stack_Size = 0x400; /* required amount of stack */

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

        KEEP (*(.init))
        KEEP (*(.fini))

        /* _sidata = .; */
    } >FLASH

    /* Constant data into "FLASH" Rom type memory */
    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)         /* .rodata sections (constants, strings, etc.) */
        *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
        . = ALIGN(4);
    } >FLASH

    _sidata = LOADADDR(.data);

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
    /* User_heap_stack section, used to check that there is enough "RAM" Ram  type memory left */
    ._user_heap_stack :
    {
        . = ALIGN(8);
        PROVIDE ( end = . );
        PROVIDE ( _end = . );
        . = . + _Min_Heap_Size;
        . = . + _Min_Stack_Size;
        . = ALIGN(8);
    } >RAM

    _estack = ORIGIN(RAM) + LENGTH(RAM);
}


