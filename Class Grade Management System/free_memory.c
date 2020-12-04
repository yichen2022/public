/* BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I HAVE PERFORMED ALL OF
THE WORK TO CREATE THIS FILE AND/OR DETERMINE THE ANSWERS FOUND WITHIN
THIS FILE MYSELF WITH NO ASSISSTANCE FROM ANY PERSON (OTHER THAN THE
INSTRUCTOR OR GRADERS OF THIS COURSE) AND I HAVE STRICTLY ADHERED TO THE
TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.
*/
#include "lab4.h"
void free_memory(Node *list_head) {
  Node *traversePtr;
  traversePtr = list_head;
  /*Traverses through the linked list to free all dynamicaly allocated storage*/
  while (traversePtr != NULL) {
  free(traversePtr);
  traversePtr = traversePtr->next;
  }
}
