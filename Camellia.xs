#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "_camellia.c"

typedef struct camellia {
    unsigned char key[256];
}* Crypt__Camellia;

MODULE = Crypt::Camellia		PACKAGE = Crypt::Camellia
PROTOTYPES: DISABLE

int
keysize(...)
    CODE:
        RETVAL = 16;
    OUTPUT:
        RETVAL

int
blocksize(...)
    CODE:
        RETVAL = 16;
    OUTPUT:
        RETVAL

Crypt::Camellia
new(class, rawkey)
    SV* class
    SV* rawkey
    CODE:
    {
        STRLEN keyLength;
        if (! SvPOK(rawkey))
            croak("Key setup error: Key must be a string scalar!");

        keyLength = SvCUR(rawkey);
        if (keyLength != 16)
            croak("Key setup error: Key must be 16 bytes long!");

        Newz(0, RETVAL, 1, struct camellia);
        Camellia_Ekeygen(128, SvPV_nolen(rawkey), RETVAL->key);
    }

    OUTPUT:
        RETVAL

SV*
encrypt(self, input)
    Crypt::Camellia self
    SV* input
    CODE:
    {
        STRLEN blockSize;
        unsigned char* intext = SvPV(input, blockSize);
        if (blockSize != 16) {
            croak("Encryption error: Block size must be 16 bytes long!");
            RETVAL = newSVpv("", 0);
        } else {
            RETVAL = newSVpv("", blockSize);
            Camellia_Encrypt(128, intext, self->key, SvPV_nolen(RETVAL));
        }
    }

    OUTPUT:
        RETVAL

SV*
decrypt(self, input)
    Crypt::Camellia self
    SV* input
    CODE:
    {
        STRLEN blockSize;
        unsigned char* intext = SvPV(input, blockSize);
        if (blockSize != 16) {
            croak("Decryption error: Block size must be 16 bytes long!");
            RETVAL = newSVpv("", 0);
        } else {
            RETVAL = newSVpv("", blockSize);
            Camellia_Decrypt(128, intext, self->key, SvPV_nolen(RETVAL));
        }
    }

    OUTPUT:
        RETVAL

void
DESTROY(self)
    Crypt::Camellia self
    CODE:
        Safefree(self);

