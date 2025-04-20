Class {
	#name : 'LibWS2_32',
	#superclass : 'Object',
	#category : 'LibWS2_32',
	#package : 'LibWS2_32'
}

{ #category : 'as yet unclassified' }
LibWS2_32 class >> WSAStartup: aVersionRequested data: aData [
	^ self ffiCall: #( int WSAStartup(ushort aVersionRequested, WSADATA* aData))
]

{ #category : 'library path' }
LibWS2_32 class >> ffiLibraryName [ 
	^ 'ws2_32.dll'
]
