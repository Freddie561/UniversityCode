using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MouseLook : MonoBehaviour
{
    public float msens = 400;
    float xRot = 0;
    Camera cam;
    
    // Start is called before the first frame update
    void Start()
    {
        cam = GetComponentInChildren<Camera>();
        Cursor.lockState = CursorLockMode.Locked;
    }

    // Update is called once per frame
    void Update()
    {
        float mouseX = Input.GetAxis("Mouse X") * msens * Time.deltaTime;
        float mouseY = Input.GetAxis("Mouse Y") * msens * Time.deltaTime;
        transform.Rotate(Vector3.up, mouseX);

        xRot -= mouseY;
        xRot = Mathf.Clamp(xRot, -90.0f, 90.0f);
        cam.transform.localRotation = Quaternion.Euler(xRot, 0, 0);
    }
}
