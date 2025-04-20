Class {
	#name : 'WSADATA',
	#superclass : 'FFIStructure',
	#classVars : [
		'Char129',
		'Char257',
		'OFFSET_IMAXSOCKETS',
		'OFFSET_IMAXUDPDG',
		'OFFSET_LPVENDORINFO',
		'OFFSET_SZDESCRIPTION',
		'OFFSET_SZSYSTEMSTATUS',
		'OFFSET_WHIGHVERSION',
		'OFFSET_WVERSION'
	],
	#category : 'LibWS2_32',
	#package : 'LibWS2_32'
}

{ #category : 'converting' }
WSADATA class >> externalTypeAlias: aTypeName [
	aTypeName = 'WORD' ifTrue: [ ^ 'ushort' ].
	^ nil
]

{ #category : 'field definition' }
WSADATA class >> fieldSpec [
	^ FFIExternalStructureFieldParser new
		parseFields: self fieldsDesc
		structure: self.
]

{ #category : 'field definition' }
WSADATA class >> fieldsDesc [
	^ #( 
		WORD wVersion;
		WORD wHighVersion;
		ushort iMaxSockets;
		ushort iMaxUdpDg;
		char* lpVendorInfo;
		Char257 szDescription;
		Char129 szSystemStatus;
	 )
]

{ #category : 'class initialization' }
WSADATA class >> initialize [
	Char257 := FFIArray newArrayTypeOf: #char size: 257.
	Char129 := FFIArray newArrayTypeOf: #char size: 129.
]

{ #category : 'accessing - structure variables' }
WSADATA >> iMaxSockets [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_IMAXSOCKETS
]

{ #category : 'accessing - structure variables' }
WSADATA >> iMaxSockets: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_IMAXSOCKETS put: anObject
]

{ #category : 'accessing - structure variables' }
WSADATA >> iMaxUdpDg [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_IMAXUDPDG
]

{ #category : 'accessing - structure variables' }
WSADATA >> iMaxUdpDg: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_IMAXUDPDG put: anObject
]

{ #category : 'as yet unclassified' }
WSADATA >> inspectorExtension [

	<inspectorPresentationOrder: 0 title: 'Struct'>
	
	| specTable fieldNames fields currentOffset fieldsAssoc ret |
	specTable := SpTablePresenter new.

	specTable addColumn: (SpStringTableColumn new
			title: 'offset' asString;
			evaluated: [:item | item at: #offset ];
			width: 40;
			beNotExpandable;
			yourself).
			
	specTable addColumn: (SpStringTableColumn new
			title: 'type' asString;
			evaluated: [:item | item at: #type ];
			width: 120;
			beNotExpandable;
			yourself).
			
	specTable addColumn: (SpStringTableColumn new
			title: 'size' asString;
			evaluated: [:item | item at: #size ];
			width: 40;
			beNotExpandable;
			yourself).
		
	specTable addColumn: (SpStringTableColumn new
			title: 'field' asString;
			evaluated: [:item | item at: #field ];
			beNotExpandable).
			
	specTable addColumn: (SpStringTableColumn new
			title: 'value' asString;
			evaluated: [:item | item at: #value ];
			beNotExpandable).
		
	fields := self class fieldSpec fields.
	fieldsAssoc := fields associations.
	currentOffset := 0.
	specTable items: ((1 to: fields size) collect: [:index | 
		| field name type ret size value |
		field := fieldsAssoc at: index.
		name := field key.
		type := field value.
		size := field value externalTypeSize.
		value := self perform: name.
		ret := Dictionary newFrom: { 
			#field -> name.
			#offset -> currentOffset.
			#size -> size.
			#type -> type tfExternalType typeName.
			#value -> ((value respondsTo: #getHandle)
				ifTrue: [ value getHandle ]
				ifFalse: [ value ]).
	 	}.
		currentOffset := (currentOffset + size).
		ret
	]).
	
	^ specTable 
]

{ #category : 'accessing - structure variables' }
WSADATA >> lpVendorInfo [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_LPVENDORINFO) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
WSADATA >> lpVendorInfo: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LPVENDORINFO put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
WSADATA >> szDescription [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFICharacterType size: 257) fromHandle: (handle copyFrom: OFFSET_SZDESCRIPTION to: OFFSET_SZDESCRIPTION + 256)
]

{ #category : 'accessing - structure variables' }
WSADATA >> szDescription: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_SZDESCRIPTION to: OFFSET_SZDESCRIPTION + 256 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
WSADATA >> szSystemStatus [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFICharacterType size: 129) fromHandle: (handle copyFrom: OFFSET_SZSYSTEMSTATUS to: OFFSET_SZSYSTEMSTATUS + 128)
]

{ #category : 'accessing - structure variables' }
WSADATA >> szSystemStatus: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_SZSYSTEMSTATUS to: OFFSET_SZSYSTEMSTATUS + 128 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
WSADATA >> wHighVersion [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WHIGHVERSION
]

{ #category : 'accessing - structure variables' }
WSADATA >> wHighVersion: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WHIGHVERSION put: anObject
]

{ #category : 'accessing - structure variables' }
WSADATA >> wVersion [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WVERSION
]

{ #category : 'accessing - structure variables' }
WSADATA >> wVersion: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WVERSION put: anObject
]
