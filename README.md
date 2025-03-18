# Parallel-Processing-OOABAP

Ever encountered a situation where you need to process certain logic which requires statement like COMMIT, SUBMIT, etc. in a RAP Behaviour Implementation?

Using such statements in a RAP Behaviour Class results in dumps like ‘BEHAVIOR_ILLEGAL_STATEMENT’.
To avoid such incompatible situations, we often tend to wrap such logic inside a Remote Function Module and call them with DESTINATION parameter inside the Behaviour Class.

However, RAP promotes a modern RESTful approach favouring usage of object-oriented programming with Classes and Methods. Function Modules are more associated with older ABAP paradigms.

Using Standard Class ‘CL_ABAP_PARALLEL’ and Standard Interface ‘IF_ABAP_PARALLEL’, we can replace Remote FMs with Classes & Methods to execute restricted statements in Behaviour Implementations in a parallel session. This approach can also be utilized to implement parallel processing wherever required.

> Refer source ‘ZCL_PARALLEL_PROCESSING.CLAS.ABAP’ where you can utilize Methods of Standard Interface ‘IF_ABAP_PARALLEL’  to write your own Custom Logic.

> Refer sample source code ‘ZCL_ADD_NUMBERS.CLAS.ABAP’ which illustrates how the Custom Logic written in previous source can be called in a parallel session using Standard Class ‘CL_ABAP_PARALLEL’.
